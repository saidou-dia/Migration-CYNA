terraform {
  backend "azurerm" {
    resource_group_name  = "rg-gva-hub-staging"
    storage_account_name = "stagetfgva"
    container_name       = "tfstate"
    key                  = "staging.terraform.tfstate"
  }
}
