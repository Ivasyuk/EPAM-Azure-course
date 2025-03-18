variable "name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "The location of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier for the App Service Plan"
  type        = string
}

variable "sku_size" {
  description = "The SKU size for the App Service Plan"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the App Service Plan"
  type        = map(string)
}
