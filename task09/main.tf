provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

module "afw" {
  source                   = "./modules/afw"
  resource_group_name      = var.rg_name
  location                 = var.location
  vnet_name                = var.vnet_name
  vnet_id                  = data.azurerm_virtual_network.vnet.id
  vnet_address_space       = var.vnet_address_space
  aks_subnet_name          = var.subnet_name
  aks_subnet_address_space = var.aks_subnet_address_space
  aks_loadbalancer_ip      = var.aks_loadbalancer_ip
  environment              = local.environment
  project_prefix           = var.project_prefix
}