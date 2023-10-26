terraform {
  backend "azurerm" {
    resource_group_name  = "kevin.schu-rg"
    storage_account_name = "kevin.schu-tfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}