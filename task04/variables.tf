variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vm_admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "vm_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-rg"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-vnet"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "frontend"
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-nsg"
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-nic"
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-pip"
}

variable "dns_label" {
  description = "DNS label for the public IP"
  type        = string
  default     = "cmaz-efe625c7-mod4-nginx"
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
  default     = "cmaz-efe625c7-mod4-vm"
}

variable "vm_size" {
  description = "VM Size"
  type        = string
  default     = "Standard_F2s_v2"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Creator = "ruslan_ivasiuk@epam.com"
  }
}
