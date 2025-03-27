locals {
  # Resource Group Name
  rg_name = format("%s-rg", var.name_prefix)

  # SQL Server Name
  sql_server_name = format("%s-sql", var.name_prefix)

  # SQL Database Name
  sql_db_name = format("%s-sql-db", var.name_prefix)

  # App Service Plan Name
  asp_name = format("%s-asp", var.name_prefix)

  # App Name
  app_name = format("%s-app", var.name_prefix)

  # SQL Admin Username
}