resource "azurerm_traffic_manager_profile" "tm" {
  name                = var.name
  resource_group_name = var.resource_group_name
  profile_status      = "Enabled"
  traffic_routing_method = "Performance"
  tags                = var.tags

  dns_config {
    relative_name = var.name
    ttl           = 60
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "app1_endpoint" {
  name                = "app1-endpoint"
  profile_id          = azurerm_traffic_manager_profile.tm.id
  target_resource_id  = var.app1_id
  weight              = 100
}

resource "azurerm_traffic_manager_azure_endpoint" "app2_endpoint" {
  name                = "app2-endpoint"
  profile_id          = azurerm_traffic_manager_profile.tm.id
  target_resource_id  = var.app2_id
 weight               = 100
}