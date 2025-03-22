variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Configuration for resource groups"
}

variable "app_service_plans" {
  type = map(object({
    name         = string
    sku_tier     = string
    sku_size     = string
    worker_count = number
  }))
  description = "Configuration for App Service Plans"
}

variable "app_services" {
  type = map(object({
    name = string
  }))
  description = "Configuration for App Services"
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

variable "verification_ip" {
  type        = string
  description = "IP address of the verification agent"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the App Service Plan"
}

variable "sku_size" {
  description = "The size of the SKU for the App Service Plan"
  type        = string
}
variable "sku_tier" {
  description = "The size of the SKU for the App Service Plan"
  type        = string
}