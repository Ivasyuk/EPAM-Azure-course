output "resource_group_ids" {
  value       = { for rg in azurerm_resource_group.rg : rg.name => rg.name }
  description = "Map of resource group names to their IDs"
}