# Create Azure SQL Server


resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.admin_username
  administrator_login_password = random_password.sql_admin.result
  version                      = "12.0"

  tags = var.tags
}

# Generate a Random password for SQL administrator
resource "random_password" "sql_admin" {
  length  = 16
  special = true
  upper   = true
  lower   = true
}


resource "azurerm_mssql_database" "db" {
  name        = var.database_name
  server_id   = azurerm_sql_server.server.id
  sku_name    = "S2" # Standard tier with 50 DTUs
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 10
  tags        = var.tags
}


resource "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name_vault
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.sql_kv_secret_name
  value        = var.admin_username
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_kv_secret_password
  value        = random_password.sql_admin.result
  key_vault_id = azurerm_key_vault.example.id
}

# Allow connection from Azure services
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Allow connection from a specific IP address
resource "azurerm_mssql_firewall_rule" "allow_specific_ip" {
  name             = "AllowSpecificIP"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}