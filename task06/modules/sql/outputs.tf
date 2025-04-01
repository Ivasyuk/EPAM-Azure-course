output "sql_connection_string" {
  description = "The connection string for the SQL Database in ADO.NET format"
  value = format("Server=tcp:%s.database.windows.net,1433;Initial Catalog=%s;User ID=%s;Password=%s;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mysql_server.server.name,
    azurerm_mysql_database.db.name,
    var.admin_username,
    random_password.sql_admin.result
  )
  sensitive = true
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}