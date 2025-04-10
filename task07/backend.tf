terraform {
  backend "azurerm" {
    resource_group_name  = "epam-task07-tfstate-rg"
    storage_account_name = "epamtask07tfstate"
    container_name       = "tfstate"
    key                 = "terraform.tfstate"
  }
}
