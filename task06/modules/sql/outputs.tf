output "sql_connection_string" {
  description = "SQL connection string"
  sensitive   = true
  value = format(
    "Server=tcp:%s.database.windows.net,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.server.name,
    azurerm_mssql_database.db.name,
    var.admin_username,
    random_password.sql_admin.result
  )
}


output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}
