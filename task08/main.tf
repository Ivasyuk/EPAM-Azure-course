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
  redis_url           = module.keyvault.redis_hostname
  redis_pwd           = module.keyvault.redis_primary_key
  acr_login_server    = module.acr.acr_login_server
  acr_admin_username  = module.acr.acr_admin_username
  acr_admin_password  = module.acr.acr_admin_password
  acr_id              = module.acr.acr_id
  tags                = var.tags
}

module "redis" {
  source         = "./modules/redis"
  name           = local.redis_name
  location       = var.location
  resource_group = azurerm_resource_group.rg.name
  capacity       = 2
  family         = "C"
  sku            = "Basic"
  tags           = var.tags

}

module "keyvault" {
  source               = "./modules/keyvault"
  name                 = local.keyvault_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  redis_host           = module.redis.hostname
  redis_key            = module.redis.primary_key
  aks_kubelet_identity = module.aks.kubelet_identity[0].object_id
  tags                 = var.tags
}

module "aks" {
  source              = "./modules/aks"
  name                = local.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  node_count          = var.node_count
  node_vm_size        = var.node_vm_size
  dns_prefix          = var.name_prefix
  node_pool_name      = "system"
  tags                = var.tags
  acr_id              = module.acr.acr_id
  key_vault_id        = module.keyvault.vault_id
  tenant_id           = data.azurerm_client_config.current.tenant_id

}


resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kubelet_identity[0].client_id
    kv_name                    = module.keyvault.vault_name
    redis_url_secret_name      = module.redis.redis_hostname_secret_name
    redis_password_secret_name = module.redis.redis_primary_key_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

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
    kubectl_manifest.secret_provider
  ]
}

# --- ADD THIS RESOURCE ---
resource "time_sleep" "wait_for_lb_ip" {
  # Wait for 5 minutes - increased from 3m
  create_duration = "5m"

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
