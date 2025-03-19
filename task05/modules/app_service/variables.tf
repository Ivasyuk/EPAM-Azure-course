variable "name" {
  description = "The name of the App Service"
  type        = string
}

variable "location" {
  description = "The location of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the associated App Service Plan"
  type        = string
}

variable "verification_agent_ip" {
  description = "The IP address of the verification agent"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the App Service Plan"
}