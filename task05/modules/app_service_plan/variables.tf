variable "name" {
  type        = string
  description = "The name of the App Service Plan"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the App Service Plan will be created"
}

variable "location" {
  type        = string
  description = "The Azure region where the App Service Plan will be created"
}

variable "sku_tier" {
  description = "The SKU tier for the App Service Plan."
  type        = string
}

variable "sku_size" {
  description = "The SKU size for the App Service Plan."
  type        = string
}

variable "worker_count" {
  type        = number
  description = "The number of workers (instances) for the App Service Plan"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the App Service Plan"
}