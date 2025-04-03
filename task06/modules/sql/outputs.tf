output "sql_connection_string" {
  description = "SQL connection string"
  sensitive   = true
  value = <<-EOT
    "Server=tcp:${azurerm_mssql_server.server.name}.database.windows.net,1433;
    Initial Catalog=${azurerm_mssql_database.db.name};
    Persist Security Info=False;
    User ID=${var.admin_username};
    Password=${random_password.sql_admin.result};
    MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  EOT
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}
