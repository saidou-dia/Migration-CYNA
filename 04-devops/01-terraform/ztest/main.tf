provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

locals {
  # Créer un map pour for_each des VNETs
  vnets = {
    for k, v in var.subnets : k => {
      location       = v.location
      resource_group = v.resource_group
      address_space  = v.address_space
      subnets        = v.subnets
    }
  }

  # Aplatir tous les subnets
  all_subnets_flat = merge([
    for vnet_name, vnet in local.vnets : {
      for subnet in vnet.subnets : "${vnet_name}_${subnet.name}" => {
        vnet_name   = vnet_name
        rg_name     = vnet.resource_group
        subnet_name = subnet.name
        prefix      = subnet.prefix
        purpose     = subnet.purpose
        location    = vnet.location
      }
    }
  ]...)
}

# Créer les Resource Groups
resource "azurerm_resource_group" "rg" {
  for_each = local.vnets

  name     = each.value.resource_group
  location = each.value.location
}

# Créer les Virtual Networks
resource "azurerm_virtual_network" "vnet" {
  for_each = local.vnets

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space       = each.value.address_space
}

# Créer les Subnets
resource "azurerm_subnet" "subnet" {
  for_each = local.all_subnets_flat

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg[each.value.vnet_name].name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_name].name
  address_prefixes     = [each.value.prefix]
}
