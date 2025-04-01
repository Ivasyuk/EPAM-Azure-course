output "sql_connection_string" {
  value = format(
    "Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${var.admin_username};Password=${azurerm_key_vault_secret.sql_admin_password.value};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  )
  sensitive   = true
  description = "The connection string for the SQL Database in ADO.NET format"

}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}