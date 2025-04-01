output "sql_connection_string" {
  description = "The connection string for the SQL Database in ADO.NET format"
  value = "Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433; Database=${azurerm_sql_database.db.name};  User ID=${var.admin_username};  Password=${azurerm_key_vault_secret.sql_admin_password.value};"
  sensitive = true
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}