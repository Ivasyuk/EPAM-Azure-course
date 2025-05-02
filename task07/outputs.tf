output "resource_group_name" {
  value = azurerm_resource_group.my_rg.name
}

output "cdn_profile_name" {
  value = azurerm_cdn_profile.cdn_profile.name
}

output "cdn_endpoint_endpoint_name" {
  value = azurerm_cdn_endpoint.cdn_endpoint.name
}

output "cdn_endpoint_fqdn" {
  value = azurerm_cdn_endpoint.cdn_endpoint.fqdn
}

output "vm_public_ip" {
  value = azurerm_public_ip.my_public_ip.ip_address
}

