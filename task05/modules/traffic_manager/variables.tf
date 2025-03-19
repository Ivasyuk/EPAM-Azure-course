variable "name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where Traffic Manager is located."
  type        = string
}

variable "location" {
  description = "The location of the Traffic Manager."
  type        = string
}

variable "app1_id" {
  description = "The resource ID of App Service 1."
  type        = string
}

variable "app2_id" {
  description = "The resource ID of App Service 2."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager profile."
  type        = map(string)
  default     = {}
}
