variable "resource_groups" {
  description = "A map of resource group objects"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "A map of tags that will be assigned to resources"
  type        = map(string)
}
