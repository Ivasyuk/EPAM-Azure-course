output "sql_connection_string" {
  value       = sensitive("Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.server.administrator_login};Password=${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")
  sensitive   = true
  description = "value of the SQL connection string"
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}