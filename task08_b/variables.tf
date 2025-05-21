variable "name_prefix" {
  description = "Prefix for resource names, will be used to derive specific resource names."
  type        = string
}

variable "location" {
  description = "The Azure region where all resources will be created."
  type        = string
}

variable "creator" {
  description = "The creator of the resources (for tagging)."
  type        = string
}

variable "acr_sku" {
  description = "The SKU for the Azure Container Registry."
  type        = string
}

variable "aks_node_pool_name" {
  description = "The name of the default node pool in AKS."
  type        = string
  default     = "system"
}

variable "aks_node_count" {
  description = "The number of nodes in the default node pool in AKS."
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "The VM size for the AKS default node pool."
  type        = string
}

variable "aks_os_disk_type" {
  description = "The OS disk type for the AKS default node pool."
  type        = string
}

variable "default_node_pool_os_disk_size_gb" {
  description = "The OS disk size in GB for the default node pool (used with Ephemeral disks)."
  type        = number
  default     = 60
}

variable "aci_sku" {
  description = "The SKU for the Azure Container Instance hosting Redis."
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type for the Azure Storage Account."
  type        = string
  default     = "LRS"
}

variable "aca_workload_profile_type" {
  description = "The workload profile type for ACA Environment and App."
  type        = string
  default     = "Consumption"
}
