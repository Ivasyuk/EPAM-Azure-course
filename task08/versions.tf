terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 1.14.0"
    }
  }
}

provider "azurerm" {
  features {}
}


provider "kubectl" {
  host                   = module.aks.aks_host
  client_certificate     = base64decode(module.aks.aks_client_certificate)
  client_key             = base64decode(module.aks.aks_client_key)
  cluster_ca_certificate = base64decode(module.aks.aks_cluster_ca_certificate)
  load_config_file       = false
}


