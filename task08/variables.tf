variable "resource_group_name" {
  description = "name of resource group"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "tags" {
  description = "tags values"
  type        = map(string)
}

variable "name_prefix" {
  type = string
}

variable "name_prefix_cr" {
  type = string
}

variable "git_pat" {
  description = "GitHub/Git source Personal Access Token used for ACR build tasks"
  type        = string
}