resource "azurerm_app_service_plan" "asp" {
  for_each = var.app_service_plans

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku {
    tier = each.value.sku_tier
    size = each.value.sku_size
  }
  reserved = true
  tags     = each.value.tags
}
