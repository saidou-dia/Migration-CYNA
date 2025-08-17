provider "azurerm" {
  features {}
}

# Création des VNETs
resource "azurerm_virtual_network" "vnet" {
  for_each = local.vnets

  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space
}

# Création des subnets
resource "azurerm_subnet" "subnet" {
  for_each = {
    for vnet_name, vnet in local.vnets :
    # on associe chaque subnet à une clé unique VNET_SubnetName
    for subnet in vnet.subnets : "${vnet_name}_${subnet.name}" => {
      vnet_name  = vnet_name
      rg_name    = vnet.resource_group
      subnet_name = subnet.name
      prefix     = subnet.prefix
    }
  }

  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.prefix]
}
