terraform {
  backend "azurerm" {
    resource_group_name  = "rg-gva-dev-hub"   # RG Dev Hub Genève
    storage_account_name = "devtfgva"         # Storage Account Dev
    container_name       = "tfstate"          # Container pour le tfstate
    key                  = "dev.geneve.tfstate" # Nom du fichier tfstate
  }
}
