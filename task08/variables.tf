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
  description = "value name prefix"
  type        = string
}

variable "name_prefix_cr" {
  default = "value name prefix for cr"
  type    = string
}

variable "git_pat" {
  description = "GitHub/Git source Personal Access Token used for ACR build tasks"
  type        = string
}

variable "aks_node_pool_node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "aks_node_pool_vm_size" {
  description = "The size of the VM for the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "aks_node_pool_os_disk_type" {
  description = "The OS disk type for the default node pool"
  type        = string
  default     = "Managed"
}

variable "aks_node_pool_name" {
  description = "The name of the default node pool"
  type        = string
  default     = "default"
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
  default     = "aks-cluster"
}
