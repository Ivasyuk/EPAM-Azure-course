output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "The default hostname of the Linux Web App"
  value       = module.webapp.app_hostname
}

output "connection_string" {
  sensitive = true
  value = module.sql.sql_connection_string
}