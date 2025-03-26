resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


module "sql" {
  source                    = "./modules/sql"
  sql_server_name           = var.sql_server_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  admin_username            = var.admin_username
  tags                      = var.tags
  database_name             = var.database_name
  resource_group_name_vault = var.resource_group_name_vault
  sql_kv_secret_password    = var.sql_kv_secret_password
  sql_kv_secret_name        = var.sql_kv_secret_name
  key_vault_name            = var.key_vault_name
  allowed_ip_address        = var.allowed_ip_address
}