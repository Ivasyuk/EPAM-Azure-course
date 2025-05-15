resource "azurerm_redis_cache" "redis_task08" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  minimum_tls_version = "1.2"
  tags                = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_redis_cache.redis_task08.hostname
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_primary_key" {
  name         = var.redis_primary_key_secret_name
  value        = azurerm_redis_cache.redis_task08.primary_access_key
  key_vault_id = var.keyvault_id
}
