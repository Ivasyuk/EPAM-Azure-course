resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location

  tags = {
    "Creator" = var.creator_tag
  }
}
