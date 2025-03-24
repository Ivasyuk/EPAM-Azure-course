output "web_app_ids" {
  description = "IDs of the created Web Apps."
  value       = { for app_key, web in azurerm_app_service.app : app_key => web.id }
}