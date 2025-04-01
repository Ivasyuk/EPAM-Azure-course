output "sql_connection_string" {
  description = "The connection string for the SQL Database in ADO.NET format"
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;",
    azurerm_mssql_server.server.fully_qualified_domain_name,
    azurerm_mssql_database.db.name,
    var.admin_username,
    random_password.sql_admin.result
  )
  sensitive = true
}
output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}