provider "azurerm" {
  features {}
}

# --- Création des VNets ---
resource "azurerm_virtual_network" "vnets" {
  for_each            = local.vnets
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space
}

# --- Création des Subnets ---
resource "azurerm_subnet" "subnets" {
  for_each = {
    for vnet_name, vnet in local.vnets :
    for subnet in vnet.subnets :
    "${vnet_name}-${subnet.name}" => {
      vnet_name       = vnet_name
      resource_group  = vnet.resource_group
      subnet_name     = subnet.name
      prefix          = subnet.prefix
    }
  }

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
  address_prefixes     = [each.value.prefix]
}
