variable "container_name" {
    description = "Name of the Azure Container"
    type = string
    default = "ruslanivasiuktask08"
}

variable "aci_name" {
    description = "Name of the container instance"
    type = string
}

variable "location" {
    description = "Azure region where resources will be created"
    type = string
}

variable "restart_policy" {
    description = "Restart policy for the container group"
    type = string
    default = "Always"
}

variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
}

variable "acr_login_server" {
    description = "Azure Container Registry login server"
    type = string
}

variable "image_name" {
    description = "Name of the container image"
    type = string
}

variable "cpu" {
    description = "CPU cores for the container"
    type = number
    default = 1
}

variable "memory" {
    description = "Memory in GB for the container"
    type = number
    default = 1
}

variable "port" {
    description = "Port to expose on the container"
    type = number
    default = 80
}