output "sql_connection_string" {
  value = "Server=${azurerm_sql_server.example.fully_qualified_domain_name};Database=${azurerm_sql_database.example.name};User Id=${azurerm_sql_server.example.administrator_login};Password=${data.azurerm_key_vault_secret.sql_password.value};Encrypt=true;Connection Timeout=30;"
  sensitive = true
  description = "value of the SQL connection string"
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}