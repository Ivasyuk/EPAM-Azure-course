variable "name" {
  description = "Traffic Manager profile name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for Traffic Manager"
  type        = string
}

variable "location" {
  description = "The location of the Traffic Manager profile"
  type        = string
}

variable "tm_dns_name" {
  description = "The DNS name for the Traffic Manager profile"
  type        = string
}

variable "endpoints" {
  description = "List of Traffic Manager endpoints"
  type = list(object({
    name            = string
    location        = string
    app_service_id  = string
  }))
}

variable "creator_tag" {
  description = "Tag for the Traffic Manager"
  type        = string
}
