
resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}



resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = var.linux_fx_version
  }

  app_settings = {
    DATABASE_CONNECTION_STRING = var.sql_connection_string
  }

  tags = var.tags
}
