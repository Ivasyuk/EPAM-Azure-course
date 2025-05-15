# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
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