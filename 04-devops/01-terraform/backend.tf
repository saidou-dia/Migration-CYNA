terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"     # RG où sera ton storage account
    storage_account_name = "stterraformstate"      # Storage Account existant ou à créer
    container_name       = "tfstate"               # Conteneur blob pour stocker l’état
    key                  = "network.tfstate"      # Nom du fichier tfstate
  }
}
