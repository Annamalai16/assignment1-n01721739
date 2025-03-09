terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01721739rg"
    storage_account_name = "tfstaten01721739sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}