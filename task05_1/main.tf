module "resource_groups" {
  source          = "./modules/resource_group"
  resource_groups = var.resource_groups
}

module "app_service" {
  source                = "./modules/app_service"
  app_services          = var.app_services
  verification_agent_ip = var.verification_agent_ip
}