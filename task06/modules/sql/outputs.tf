output "sql_connection_string" {
    value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.server.fully_qualified_domain_name,
    azurerm_mssql_database.db.name,
    var.admin_username,
    azurerm_key_vault_secret.sql_admin_password.value
  )
  sensitive   = true
  description = "The connection string for the SQL Database in ADO.NET format"

}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}