output "container_registry_name" {
  value = azurerm_container_registry.task08_acr.name
}

output "container_registry_login_server" {
  value = azurerm_container_registry.task08_acr.login_server
}