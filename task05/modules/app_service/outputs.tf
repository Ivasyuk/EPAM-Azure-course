output "app_service_id" {
  description = "The ID of the App Service"
  value       = azurerm_app_service.app.id
}

output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_app_service.app.name
}

output "app_service_url" {
  description = "The URL of the App Service"
  value       = azurerm_app_service.app.default_site_hostname
}
