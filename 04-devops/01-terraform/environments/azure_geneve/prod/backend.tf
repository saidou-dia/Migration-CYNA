terraform {
  backend "azurerm" {
    resource_group_name   = "rg-gva-prod-hub"    # RG où sera le storage account
    storage_account_name  = "prodtfgva"          # Storage Account unique pour prod
    container_name        = "tfstate"            # Container pour stocker le .tfstate
    key                   = "prod-geneve.tfstate" # Nom du fichier tfstate pour prod
  }
}
