variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  description = "A map of resource group objects"
}

variable "app_service_plans" {
  description = "Map of App Service Plans to be created."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_tier            = string
    sku_size            = string
    tags                = map(string)
  }))
}


variable "app_services" {
  description = "Map of app services to create."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    app_service_plan_id  = string
    tags                 = map(string)
  }))
}

variable "tm_profile_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "tm_routing_method" {
  type        = string
  description = "Routing method for Traffic Manager"
}

variable "allow_ip_rule_name" {
  type        = string
  description = "Name of the IP restriction rule for verification agent"
}

variable "allow_tm_rule_name" {
  type        = string
  description = "Name of the IP restriction rule for Traffic Manager"
}

variable "verification_agent_ip" {
  description = "Verification agent IP address"
  type        = string
}