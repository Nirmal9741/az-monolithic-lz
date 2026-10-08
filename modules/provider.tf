terraform {
  required_providers {
    azurerm = {
      version = "5.6.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
