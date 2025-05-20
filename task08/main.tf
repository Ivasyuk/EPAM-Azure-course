data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "acr" {
  source              = "./modules/acr"
  name                = local.acr_name
  resource_group_name = local.rg_name
  location            = var.location
  sku                 = var.acr_sku
  git_repo_url        = var.git_repo_url
  git_repo_branch     = var.git_repo_branch
  git_pat             = var.git_pat
  image_repo_name     = var.image_repo_name
  tags                = var.tags
}

module "aci" {
  source              = "./modules/aci"
  name                = local.aci_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_name_label      = local.aci_name
  image               = "${module.acr.login_server}/${var.image_repo_name}:latest"
  cpu                 = 1
  memory              = 1.5
  redis_url           = module.redis.redis_hostname_secret_name
  redis_pwd           = module.redis.redis_primary_key_secret_name
  acr_login_server    = module.acr.acr_login_server
  acr_admin_username  = module.acr.acr_admin_username
  acr_admin_password  = module.acr.acr_admin_password
  acr_id              = module.acr.acr_id
  tags                = var.tags
}

module "redis" {
  source                        = "./modules/redis"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  redis_name                    = local.redis_name
  redis_capacity                = var.redis_capacity
  redis_family                  = var.redis_family
  redis_sku                     = var.redis_sku
  tags                          = var.tags
  key_vault_id                  = module.keyvault.key_vault_id
  redis_hostname_secret_name    = "redis-hostname"
  redis_primary_key_secret_name = "redis-primary-key"

  depends_on = [
    module.keyvault
  ]
}

module "keyvault" {
  source                 = "./modules/keyvault"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  key_vault_name         = local.keyvault_name
  key_vault_sku          = var.key_vault_sku
  tags                   = var.tags
  tenant_id              = data.azurerm_client_config.current.tenant_id
  current_user_object_id = data.azurerm_client_config.current.object_id
}


module "aks" {
  source                            = "./modules/aks"
  resource_group_name               = azurerm_resource_group.rg.name
  location                          = azurerm_resource_group.rg.location
  aks_name                          = local.aks_name
  tags                              = var.tags
  dns_prefix                        = local.aks_name
  node_pool_name                    = var.aks_node_pool_name
  node_count                        = var.aks_node_count
  vm_size                           = var.aks_vm_size                       # Make sure this is set via tfvars/env per task spec (e.g. "Standard_D2ads_v5")
  os_disk_type                      = var.aks_os_disk_type                  # Make sure this is set via tfvars/env per task spec (e.g. "Ephemeral")
  default_node_pool_os_disk_size_gb = var.default_node_pool_os_disk_size_gb # Make sure this is passed from root variables
  acr_id                            = module.acr.acr_id
  key_vault_id                      = module.keyvault.key_vault_id
  tenant_id                         = data.azurerm_client_config.current.tenant_id
  key_vault_name                    = module.keyvault.key_vault_name

  depends_on = [
    module.acr,
    module.keyvault
  ]

}


resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.aks_kv_identity_client_id
    kv_name                    = module.keyvault.key_vault_name
    redis_url_secret_name      = module.redis.redis_hostname_secret_name
    redis_password_secret_name = module.redis.redis_primary_key_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })
  depends_on = [
    module.aks
  ]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_repo_name
    image_tag        = "latest"
    redis_host_key   = "redis-hostname"
    redis_pwd_key    = "redis-primary-key"
  })

  wait_for_rollout = false

  depends_on = [
    kubectl_manifest.service
  ]
}


resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [
    kubectl_manifest.deployment
  ]
}



resource "time_sleep" "wait_for_lb_ip" {
  # Wait for 5 minutes - increased from 3m
  create_duration = "6m"

  # Ensure it runs after the service manifest is applied
  depends_on = [
    kubectl_manifest.service
  ]
}


data "kubernetes_service" "app" { # Ensure name matches outputs.tf
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [
    # Ensure data is read AFTER the sleep
    time_sleep.wait_for_lb_ip
  ]
}
