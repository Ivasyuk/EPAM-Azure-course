resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "sql" {
  source                    = "./modules/sql"
  sql_server_name           = local.sql_server_name
  resource_group_name       = local.rg_name
  location                  = var.location
  admin_username            = var.admin_username
  tags                      = var.tags
  database_name             = local.sql_db_name
  resource_group_name_vault = var.resource_group_name_vault
  sql_kv_secret_password    = var.sql_kv_secret_password
  sql_kv_secret_name        = var.sql_kv_secret_name
  key_vault_id              = data.azurerm_key_vault.my_vault.id
  allowed_ip_address        = var.allowed_ip_address
}

data "azurerm_key_vault" "my_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name_vault
}

module "webapp" {
  source                = "./modules/webapp"
  asp_name              = local.asp_name
  webapp_name           = local.app_name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  sku_name              = var.sku_name
  os_type               = var.os_type
  linux_fx_version      = "PYTHON|3.9"
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}