variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "location" {
  description = "The Azure location where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "resource_group_name_vault" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "database_name" {
  description = "The name of the SQL Database"
  type        = string
}

variable "tags" {
  description = "Resource Group Name"
  type = object({
    Creator = string
  })
}


variable "key_vault_id" {
  description = "The ID of the existing Key Vault"
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