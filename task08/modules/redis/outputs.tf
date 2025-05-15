output "redis_hostname" {
  description = "Redis Cache hostname"
  value       = azurerm_redis_cache.redis_task08.hostname
}

output "redis_primary_access_key" {
  description = "Redis Cache primary access key"
  value       = azurerm_redis_cache.redis_task08.primary_access_key
  sensitive   = true
}
