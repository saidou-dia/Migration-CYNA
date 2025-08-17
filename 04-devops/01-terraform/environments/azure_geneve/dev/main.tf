# main.tf - dev - azure_geneve

terraform {
  required_version = ">= 1.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-geneve-dev"
    storage_account_name = "sttgenevedevtf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# On filtre uniquement les VNETs Genève pour dev si nécessaire
locals {
  geneve_vnets_dev = {
    for k, v in local.vnets :
    k => v if contains(k, "gva") || contains(k, "pca")
  }
}

# Boucle pour créer les VNETs
resource "azurerm_virtual_network" "geneve_vnets" {
  for_each            = local.geneve_vnets_dev
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space
}

# Boucle pour créer les subnets de chaque VNET
resource "azurerm_subnet" "geneve_subnets" {
  for_each = {
    for vnet_key, vnet in local.geneve_vnets_dev :
    "${vnet_key}-${vnet_subnet.name}" => {
      vnet_name = vnet_key
      subnet    = vnet_subnet
    }
    for vnet_subnet in vnet.subnets
  }

  name                 = each.value.subnet.name
  resource_group_name  = local.geneve_vnets_dev[each.value.vnet_name].resource_group
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.subnet.prefix]
}
