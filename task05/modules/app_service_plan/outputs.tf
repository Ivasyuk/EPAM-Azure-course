output "app_service_plan_ids" {
  value       = { for asp, plan in azurerm_app_service_plan.asp : asp => plan.id }
  description = "The IDs of the created app service plans"
}