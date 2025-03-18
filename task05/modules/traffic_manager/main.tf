resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                = var.name
  resource_group_name = var.resource_group_name
  // location attribute removed
  traffic_routing_method = "Performance"
  dns_config {
    relative_name = var.tm_dns_name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }

  tags = {
    "Creator" = var.creator_tag
  }
}

resource "azurerm_traffic_manager_endpoint" "tm_endpoint" {
  count = length(var.endpoints)

  name                          = var.endpoints[count.index].name
  profile_name                  = azurerm_traffic_manager_profile.tm_profile.name
  resource_group_name           = var.resource_group_name
  endpoint_location             = var.endpoints[count.index].location
  target_resource_id           = var.endpoints[count.index].app_service_id
  endpoint_type                 = "AzureEndpoints"
}
