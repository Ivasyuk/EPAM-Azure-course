variable "asp_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "webapp_name" {
  description = "The name of the Linux Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "sku_name" {
  description = "The SKU tier for the App Service Plan"
  type        = string
}

variable "os_type" {
  description = "The OS type for the App Service Plan (e.g., 'Linux')"
  type        = string

}

variable "linux_fx_version" {
  description = "The runtime stack for the Linux Web App (e.g., 'PYTHON|3.9')"
  type        = string
}

variable "connection_string" {
  description = "The connection string to the database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}