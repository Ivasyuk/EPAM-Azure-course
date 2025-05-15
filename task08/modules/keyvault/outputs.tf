output "id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.keyvault_task08.id
}


output "keyvault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.keyvault_task08.vault_uri
}
