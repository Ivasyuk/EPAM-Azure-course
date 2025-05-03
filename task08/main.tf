# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "main_azure_container_registry" {
    source = "./modules/acr"
    resource_group_name = "cmtr-efe625c7-mod8-rg"
    location = "US West 2"
    acr_name = "cmtrefe625c7mod8cr"
    acr_sku_name = "Basic"


}