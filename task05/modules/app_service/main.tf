resource "azurerm_app_service" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  tags                = var.tags


  site_config {
    windows_fx_version = "DOTNET|5.0"

    ip_restriction {
      name     = "allow-ip"
      action   = "Allow"
      priority = 100
      ip_address = var.verification_agent_ip
    }

    ip_restriction {
      name     = "allow-tm"
      action   = "Allow"
      priority = 200
      service_tag = "AzureTrafficManager"
    }

    ip_restriction {
      action   = "Deny"
      priority = 300
    }
  }
   
}
