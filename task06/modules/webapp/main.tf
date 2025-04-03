
resource "azurerm_app_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    tier = "Standart"
    size = var.sku_name
  }
  tags = var.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = azurerm_service_plan.asp.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }

  connection_string {
    name  = "sql_connection_string"
    type  = "SQLServer"
    value = var.sql_connection_string
  }
}

  