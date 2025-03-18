resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  traffic_routing_method  = var.routing_method
  tags                    = var.tags

  dns_config {
    relative_name = var.relative_name
    ttl           = 30  # TTL in seconds (adjust as needed)
  }

  monitor_config {
    protocol = var.monitor_protocol
    port     = var.monitor_port
    path     = var.monitor_path
  }
}

resource "azurerm_traffic_manager_endpoint" "tm_endpoint" {
  for_each               = var.endpoints
  name                   = each.key
  profile_name           = azurerm_traffic_manager_profile.tm_profile.name
  resource_group_name    = var.resource_group_name
  type                   = "azureEndpoints"
  target_resource_id     = each.value
  weight                 = 100
}
