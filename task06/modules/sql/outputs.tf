output "connection_string" {
  description = "The connection string for the SQL Database"
  value = format("Server=tcp:%s.database.windows.net,1433;Database=%s;User ID=%s;Password=%s;Encrypt=true;Connection Timeout=30;",
    azurerm_mssql_server.server.name,
    azurerm_mssql_database.db.name,
    var.admin_username,
    random_password.sql_admin.result
  )
  sensitive = true
}