variable "resource_group_name" {
    description = "name of resource group"
    type = string
}

variable "location" {
    description = "location"
    type = string
}

variable "acr_name" {  
    description = "name of container registry"
    type = string
}

variable "acr_sku_name" {  
    description = "name of container registry SKU"
    type = string
}