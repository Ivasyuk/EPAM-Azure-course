variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Resource Group Name"
  type        = string
}

variable "tags" {
  description = "Resource Group Name"
  type        = map(string)
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "database_name" {
  description = "The name of the SQL Database"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "resource_group_name_vault" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "admin_username" {
  description = "The name of the SQL Server Admin"
  type        = string

}

variable "sql_kv_secret_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "sql_kv_secret_password" {
  description = "The name of the SQL server"
  type        = string
}

variable "allowed_ip_address" {
  description = "The IP address to allow connections to the SQL Server"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string

}

variable "resource_group_name_vault" {
  description = "The name of the Azure Resource Group"
  type        = string

}

variable "name_prefix" {
  description = "The prefix for naming all resources"
  type        = string
  default     = "cmaz-efe625c7-mod6"
}