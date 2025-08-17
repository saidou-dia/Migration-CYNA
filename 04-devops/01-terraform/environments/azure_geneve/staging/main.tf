# main.tf - staging - azure_geneve

terraform {
  required_version = ">= 1.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-geneve-staging"
    storage_account_name = "sttgenevestagingtf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Filtre uniquement les VNETs Genève pour staging
locals {
  geneve_vnets_staging = {
    for k, v in local.vnets :
    k => v if k == "gva_prod" || k == "gva_hub" || k == "pca_gva"
  }
}

# Création des VNETs staging
resource "azurerm_virtual_network" "geneve_vnets" {
  for_each            = local.geneve_vnets_staging
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space
}

# Création des subnets staging
resource "azurerm_subnet" "geneve_subnets" {
  for_each = {
    for vnet_key, vnet in local.geneve_vnets_staging :
    "${vnet_key}-${vnet_subnet.name}" => {
      vnet_name = vnet_key
      subnet    = vnet_subnet
    }
    for vnet_subnet in vnet.subnets
  }

  name                 = each.value.subnet.name
  resource_group_name  = local.geneve_vnets_staging[each.value.vnet_name].resource_group
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.subnet.prefix]
}
