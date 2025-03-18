module "rg1" {
  source   = "./modules/resource_group"
  name     = "cmaz-efe625c7-mod5-rg-01"
  location = "East US"
  tags     = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "rg2" {
  source   = "./modules/resource_group"
  name     = "cmaz-efe625c7-mod5-rg-02"
  location = "West US"
  tags     = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "rg3" {
  source   = "./modules/resource_group"
  name     = "cmaz-efe625c7-mod5-rg-03"
  location = "Central US"
  tags     = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "asp1" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-efe625c7-mod5-asp-01"
  location            = module.rg1.location
  resource_group_name = module.rg1.name
  sku_tier            = "P0v3"
  sku_size            = "P1"
  tags                = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "asp2" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-efe625c7-mod5-asp-02"
  location            = module.rg2.location
  resource_group_name = module.rg2.name
  sku_tier            = "P1v3"
  sku_size            = "P2"
  tags                = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "app1" {
  source              = "./modules/app_service"
  name                = "cmaz-efe625c7-mod5-app-01"
  location            = module.rg1.location
  resource_group_name = module.rg1.name
  app_service_plan_id = module.asp1.app_service_plan_id
  allow_ip            = "18.153.146.156"
  tags                = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "app2" {
  source              = "./modules/app_service"
  name                = "cmaz-efe625c7-mod5-app-02"
  location            = module.rg2.location
  resource_group_name = module.rg2.name
  app_service_plan_id = module.asp2.app_service_plan_id
  allow_ip            = "18.153.146.156"
  tags                = { Creator = "ruslan_ivasiuk@epam.com" }
}

module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = "cmaz-efe625c7-mod5-traf"
  location            = module.rg3.location
  resource_group_name = module.rg3.name
  routing_method      = "Performance"
  relative_name       = "cmaz-efe625c7-mod5-traf"
  endpoints = {
    app1 = module.app1.app_service_id
    app2 = module.app2.app_service_id
  }
  tags = { Creator = "ruslan_ivasiuk@epam.com" }
}