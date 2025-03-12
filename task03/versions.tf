terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.5.7"
    }
  }
}

provider "azurerm" {
  features {}
}