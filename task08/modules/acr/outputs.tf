
output "login_server" {
  description = "ACR Login Server URL"
  value       = azurerm_container_registry.task08_acr.login_server
}

output "id" {
  description = "The ID of the ACR"
  value       = azurerm_container_registry.task08_acr.id
}

