output "traffic_manager_profile_id" {
  description = "The ID of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.tm_profile.id
}

output "traffic_manager_profile_fqdn" {
  description = "The FQDN of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.tm_profile.fqdn
}
