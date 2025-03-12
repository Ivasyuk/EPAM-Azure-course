variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "subnet_names" {
  description = "List of subnets to be created"
  type        = list(string)
  default     = ["frontend", "backend"]
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
