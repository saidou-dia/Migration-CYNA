resource "azurerm_resource_group" "rg" {
  for_each = var.vnets
  name     = each.value.resource_group
  location = each.value.location
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnets
  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = local.all_subnets_flat

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg[each.value.vnet_name].name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_name].name
  address_prefixes     = [each.value.prefix]
}
