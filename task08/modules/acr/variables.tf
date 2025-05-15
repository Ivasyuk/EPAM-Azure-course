
variable "resource_group_name" {
  description = "name of resource group"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "acr_name" {
  description = "name of container registry"
  type        = string
}

variable "acr_sku_name" {
  description = "name of container registry SKU"
  type        = string
}

variable "context_path" {
  description = "value of context path"
  type        = string
}

variable "context_access_token" {
  description = "value context_access_token"
  type        = string
}

variable "image_names" {
  description = "name for image"
  type        = list(any)

}

variable "git_pat" {
  type      = string
  sensitive = true
}