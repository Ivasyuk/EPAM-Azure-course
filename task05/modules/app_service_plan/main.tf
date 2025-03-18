resource "azurerm_app_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"
  reserved            = true

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  tags = {
    "Creator" = var.creator_tag
  }
}
