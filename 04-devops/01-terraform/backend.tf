terraform {
  backend "azurerm" {
    resource_group_name  = "rg-paris-hub"
    storage_account_name = "pratfparis"
    container_name       = "tfstate"
    key                  = "pra.terraform.tfstate"
  }
}
