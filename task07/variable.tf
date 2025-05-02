variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = "epam-task07-rg"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "West US"
}

variable "subscription_id" {
  description = "The Azure subscription ID where the resources will be created."
  type        = string
  default     = "027e47ba-3a0e-415b-8eed-790642b9dd0e" # Replace with your actual subscription ID
}

variable "cdn_profile_name" {
  description = "Name of the CDN profile"
  type        = string
  default     = "epam-task07-cdn-profile"
}

variable "cdn_endpoint_name" {
  description = "Name of the CDN endpoint"
  type        = string
  default     = "epam-task07-cdn-endpoint"
}