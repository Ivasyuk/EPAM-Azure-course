resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.key_vault_sku
  tags                = var.tags

  enable_rbac_authorization  = false 
  soft_delete_retention_days = 7
  purge_protection_enabled   = false 
}


resource "azurerm_key_vault_access_policy" "current_user_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.current_user_object_id


  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge",
    "Backup",
    "Restore",
    "Recover"
  ]


}

