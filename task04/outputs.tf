output "vm_public_ip" {
  description = "value of the public IP address"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "vm_fqdn" {
  description = "value of the public IP FQDN"
  value       = azurerm_public_ip.public_ip.fqdn
}
