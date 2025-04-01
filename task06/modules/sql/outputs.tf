output "sql_connection_string" {
  sensitive   = true
  description = "The connection string for the SQL Database"
  value       = "Server=tcp:${azurerm_mssql_server.server.name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${azurerm_key_vault_secret.sql_admin_name.value};Password=${azurerm_key_vault_secret.sql_admin_password.value};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}

