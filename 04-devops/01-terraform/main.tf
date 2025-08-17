# Fournisseur Azure
provider "azurerm" {
  features {}
}

# Variable pour l'environnement
variable "environment" {
  type    = string
  default = "prod"   # tu peux changer en dev, test, etc.
}

# Création des VNETs
resource "azurerm_virtual_network" "vnet" {
  for_each = local.vnets

  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space

  tags = {
    environment = var.environment
    location    = each.value.location
  }
}

# Création des subnets
resource "azurerm_subnet" "subnet" {
  for_each = {
    for vnet_name, vnet in local.vnets :
    for subnet in vnet.subnets : "${vnet_name}_${subnet.name}" => {
      vnet_name  = vnet_name
      rg_name    = vnet.resource_group
      subnet_name = subnet.name
      prefix     = subnet.prefix
      purpose    = subnet.purpose
    }
  }

  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.prefix]

  tags = {
    environment = var.environment
    purpose     = each.value.purpose
  }
}
