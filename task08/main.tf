# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "main_azure_container_registry" {
    source = "./modules/acr"
    resource_group_name = "cmtr-efe625c7-mod8-rg"
    location = "West US 2"
    acr_name = "cmtrefe625c7mod8cr"
    acr_sku_name = "Basic"
    context_path = "https://github.com/Ivasyuk/EPAM-Azure-course#main:task08/application/"
    context_access_token = 
    image_names = ["ruslanivasiuktask08"]

}