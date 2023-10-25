terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}