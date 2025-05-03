variable "resource_group_name" {
    description = "name of resource group"
    type = string
}

variable "location" {
    description = "location"
    type = string
}

variable "tags" {
    description = "tags values"
    type =  map(string)
}