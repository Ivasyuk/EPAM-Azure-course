module "rg1" {
  source = "./modules/resource_group"
  name     = var.rg1_name
  location = var.rg1_location
  creator_tag = var.creator_tag
}

module "rg2" {
  source = "./modules/resource_group"
  name     = var.rg2_name
  location = var.rg2_location
  creator_tag = var.creator_tag
}

module "rg3" {
  source = "./modules/resource_group"
  name     = var.rg3_name
  location = var.rg3_location
  creator_tag = var.creator_tag
}

module "asp1" {
  source = "./modules/app_service_plan"
  name                 = var.asp1_name
  location             = var.asp1_location
  resource_group_name  = module.rg1.name
  sku_tier             = var.asp1_sku_tier
  sku_size             = var.asp1_sku_size
  creator_tag          = var.creator_tag
}

module "asp2" {
  source = "./modules/app_service_plan"
  name                 = var.asp2_name
  location             = var.asp2_location
  resource_group_name  = module.rg2.name
  sku_tier             = var.asp2_sku_tier
  sku_size             = var.asp2_sku_size
  creator_tag          = var.creator_tag
}

module "app1" {
  source = "./modules/app_service"
  name                     = var.app1_name
  location                 = var.app1_location
  resource_group_name      = module.rg1.name
  app_service_plan_id      = module.asp1.id
  verification_agent_ip   = var.verification_agent_ip
  creator_tag              = var.creator_tag
}

module "app2" {
  source = "./modules/app_service"
  name                     = var.app2_name
  location                 = var.app2_location
  resource_group_name      = module.rg2.name
  app_service_plan_id      = module.asp2.id
  verification_agent_ip   = var.verification_agent_ip
  creator_tag              = var.creator_tag
}

module "tm" {
  source = "./modules/traffic_manager"
  name                    = var.tm_name
  resource_group_name     = module.rg3.name
  location                = var.tm_location
  tm_dns_name             = var.tm_dns_name
  endpoints               = var.tm_endpoints
  creator_tag             = var.creator_tag
}

