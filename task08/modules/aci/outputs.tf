output "aci_fqdn" {
  description = "Fully Qualified Domain Name for the Azure Container Instance"
  value       = azurerm_container_group.container_tas08.fqdn
}
