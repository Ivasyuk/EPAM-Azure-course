output "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_app_service_plan.asp.id
}

output "app_service_plan_name" {
  description = "The name of the App Service Plan"
  value       = azurerm_app_service_plan.asp.name
}
