resource "azurerm_app_service" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {
    windows_fx_version = "Windows|4.8"

    ip_restriction {
      name       = "allow-ip"
      action     = "Allow"
      priority   = 100
      ip_address = var.allow_ip
    }

    ip_restriction {
      name       = "allow-tm"
      action     = "Allow"
      priority   = 101
      service_tag = "AzureTrafficManager"
    }
  }

  tags = var.tags
}
