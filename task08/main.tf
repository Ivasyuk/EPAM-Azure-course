# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

provider "kubernetes" {
  host                   = module.aks.kube_config[0].host
  client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
  client_key             = base64decode(module.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)
}

provider "kubectl" {
  host                   = module.aks.kube_config[0].host
  client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
  client_key             = base64decode(module.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)
  load_config_file       = false
}


module "acr" {
  source               = "./modules/acr"
  resource_group_name  = local.rg_name
  location             = var.location
  acr_name             = local.acr_name
  acr_sku_name         = "Basic"
  context_path         = "https://github.com/Ivasyuk/EPAM-Azure-course#main:task08/application/"
  context_access_token = var.git_pat
  git_pat              = var.git_pat
  image_names          = [local.docker_image_name]
}

module "aci" {
  source              = "./modules/aci"
  aci_name            = local.aci_name
  resource_group_name = local.rg_name
  location            = var.location
  image_name          = local.docker_image_name
  acr_login_server    = module.acr.login_server

}

module "keyvault" {
  source              = "./modules/keyvault"
  name                = local.keyvault_name
  location            = var.location
  resource_group_name = local.rg_name
  sku_name            = "standard"
  tags                = var.tags
}


module "redis" {
  source                        = "./modules/redis"
  name                          = local.redis_name
  location                      = var.location
  resource_group_name           = local.rg_name
  capacity                      = 2
  family                        = "C"
  sku_name                      = "Basic"
  tags                          = var.tags
  keyvault_id                   = module.keyvault.id
  redis_hostname_secret_name    = "redis-hostname"
  redis_primary_key_secret_name = "redis-primary-key"
}

module "aks" {
  source = "./modules/aks"

  # Required arguments for AKS
  name                = local.aks_name     # Cluster name
  location            = var.location       # Region for AKS cluster
  resource_group_name = local.rg_name      # Resource group name
  tags                = var.tags           # Tags to be applied to the resources
  acr_id              = module.acr.id      # ACR registry ID
  keyvault_id         = module.keyvault.id # Key Vault ID

  # Node pool settings
  default_node_pool_node_count   = var.aks_node_pool_node_count   # Number of nodes
  default_node_pool_vm_size      = var.aks_node_pool_vm_size      # VM size for node pool
  default_node_pool_name         = var.aks_node_pool_name         # Name of node pool
  default_node_pool_os_disk_type = var.aks_node_pool_os_disk_type # OS disk type for node pool

  # DNS prefix for AKS
  dns_prefix = var.aks_dns_prefix # DNS prefix for the cluster
}

resource "kubectl_manifest" "redis_secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    keyvault_name = module.keyvault.keyvault_uri
    tenant_id     = data.azurerm_client_config.current.tenant_id
  })
  depends_on = [module.aks]
}

resource "kubectl_manifest" "app_deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    image_name            = "${module.acr.login_server}/${local.image_name}:latest"
    redis_hostname_secret = "redis-hostname"
    redis_password_secret = "redis-primary-key"
  })
  depends_on = [kubectl_manifest.redis_secret_provider]
}

resource "kubectl_manifest" "app_service" {
  yaml_body  = file("${path.module}/k8s-manifests/service.yaml")
  depends_on = [kubectl_manifest.app_deployment]
}

data "kubernetes_service" "app_service" {
  metadata {
    name      = "app-service"
    namespace = "default"
  }
  depends_on = [kubectl_manifest.app_service]
}

data "azurerm_client_config" "current" {}
