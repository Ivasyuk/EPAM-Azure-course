
/* module "rg1" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg1.name
  location            = var.resource_groups.rg1.location
  tags                = var.tags
}

module "rg2" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg2.name
  location            = var.resource_groups.rg2.location
  tags                = var.tags
}

module "rg3" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg3.name
  location            = var.resource_groups.rg3.location
  tags                = var.tags
} */

module "resource_groups" {
  source = "./modules/resource_group"

  for_each = var.resource_groups

  resource_group_name = each.value.name
  location            = each.value.location
  tags                = var.tags
}


/* module "asp1" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plans.asp1.name
  resource_group_name = module.resource_groups["rg1"].resource_group_name
  location            = module.resource_groups["rg1"].location
  sku_tier            = var.app_service_plans.asp1.sku_tier
  sku_size            = var.app_service_plans.asp1.sku_size
  worker_count        = var.app_service_plans.asp1.worker_count
  tags                = var.tags
}

module "asp2" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plans.asp2.name
  resource_group_name = module.resource_groups["rg2"].resource_group_name
  location            = module.resource_groups["rg2"].location
  sku_tier            = var.app_service_plans.asp2.sku_tier
  sku_size            = var.app_service_plans.asp2.sku_size
  worker_count        = var.app_service_plans.asp2.worker_count
  tags                = var.tags
} */


module "app_service_plans" {
  source = "./modules/app_service_plan"

  for_each = var.app_service_plans

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].resource_group_name
  location            = module.resource_groups[each.value.resource_group_key].location
  sku_tier            = each.value.sku_tier
  sku_size            = each.value.sku_size
  worker_count        = each.value.worker_count
  tags                = var.tags
}



/* module "app1" {
  source                = "./modules/app_service"
  name                  = var.app_services.app1.name
  resource_group_name   = module.resource_groups["rg1"].resource_group_name
  location              = module.resource_groups["rg1"].location
  app_service_plan_id   = module.asp1.asp_id
  verification_agent_ip = var.verification_ip
  tags                  = var.tags
}

module "app2" {
  source                = "./modules/app_service"
  name                  = var.app_services.app2.name
  resource_group_name   = module.resource_groups["rg2"].resource_group_name
  location              = module.resource_groups["rg2"].location
  app_service_plan_id   = module.asp2.asp_id
  verification_agent_ip = var.verification_ip
  tags                  = var.tags

} */

module "app_services" {
  source = "./modules/app_service"

  for_each = var.app_services

  name                  = each.value.name
  resource_group_name   = module.resource_groups[each.value.resource_group_key].resource_group_name
  location              = module.resource_groups[each.value.resource_group_key].location
  app_service_plan_id   = module.app_service_plans[each.value.app_service_plan_key].asp_id
  verification_agent_ip = each.value.verification_agent_ip
  tags                  = var.tags
}


module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = var.tm_profile_name
  resource_group_name = module.resource_groups["rg3"].resource_group_name
  location            = module.resource_groups["rg3"].location
  app1_id             = module.app_services["app1"].app_id
  app2_id             = module.app_services["app2"].app_id
  tags                = var.tags
}