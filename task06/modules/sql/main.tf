
resource "azurerm_sql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = azurerm_key_vault_secret.sql_admin_password.value

  tags = var.tags
}


# Generate a Random password for SQL administrator
resource "random_password" "sql_admin" {
  length  = 16
  special = true
  upper   = true
  lower   = true
}


resource "azurerm_sql_database" "db" {
  name                             = var.database_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  server_name                      = var.sql_server_name
  requested_service_objective_name = "S2"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
}



resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.sql_kv_secret_name
  value        = var.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_kv_secret_password
  value        = random_password.sql_admin.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_sql_firewall_rule" "allow_azure_services" {
  name                = "allow-azure-services"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.server.name
  start_ip_address    = "0.0.0.0" # Allow Azure services
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "allow_specific_ip" {
  name        = "allow-specific-ip"
  server_name = azurerm_sql_server.server.name

  resource_group_name = var.resource_group_name
  start_ip_address    = var.allowed_ip_address # Allow the specified IP address
  end_ip_address      = var.allowed_ip_address
}