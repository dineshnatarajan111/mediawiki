terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.0.2"
    }
  }

  backend "azurerm" {
    storage_account_name = "terrafrom"
    container_name = "dev"
    key = ""
  }
  
}

provider "azurerm" {
  features {}
}