output "fqdn" {
  description = "The FQDN of the container group derived from `dns_name_label`."
  value       = azurerm_container_group.container_tas08.fqdn
}