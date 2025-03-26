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

variable "database_name" {
  description = "The name of the SQL Database"
  type        = string
}