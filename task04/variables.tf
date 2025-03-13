variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "vm_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
}

variable "dns_label" {
  description = "DNS label for the public IP"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "VM Size"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "allow_http_rule" {
  description = "Network security rule to allow HTTP traffic"
  type = object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })
}