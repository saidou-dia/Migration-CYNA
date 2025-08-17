terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "stterraformbackend"
    container_name       = "tfstate"
    key                  = "network.tfstate"  # Tu peux changer pour chaque site si nécessaire
  }
}
