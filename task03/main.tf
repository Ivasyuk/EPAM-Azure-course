terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

provider "azurerm" {
      # Configuration options
      features {  
      }
      subscription_id = "027e47ba-3a0e-415b-8eed-790642b9dd0e"
}

resource "azurerm_resource_group" "example" {
  name     = "TestResourceGroup"
  location = "East US"
}