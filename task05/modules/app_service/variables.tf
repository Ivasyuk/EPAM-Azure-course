variable "name" {
  description = "The name of the App Service"
  type        = string
}

variable "location" {
  description = "The location of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "app_service_plan_id" {
  description = "The App Service Plan ID"
  type        = string
}

variable "allow_ip" {
  description = "IP address to allow"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the App Service"
  type        = map(string)
}
