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
  default     = "my-sql-server"
}

variable "database_name" {
  description = "The name of the SQL Database"
  type        = string
}