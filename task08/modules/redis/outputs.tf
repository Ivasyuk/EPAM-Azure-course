output "hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "primary_key" {
  value = azurerm_redis_cache.redis.primary_access_key
}

output "redis_hostname_secret_name" {
  description = "The name of the Key Vault Secret for Redis hostname"
  value       = var.redis_hostname_secret_name
}

output "redis_primary_key_secret_name" {
  description = "The name of the Key Vault Secret for Redis primary key"
  value       = var.redis_primary_key_secret_name
}
