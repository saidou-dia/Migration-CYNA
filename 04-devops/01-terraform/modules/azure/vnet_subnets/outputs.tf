# Outputs pour les Virtual Networks
output "all_vnets" {
  description = "Liste de tous les Virtual Networks créés"
  value = {
    for k, v in azurerm_virtual_network.vnet :
    k => {
      id       = v.id
      name     = v.name
      location = v.location
      rg_name  = v.resource_group_name
      address_space = v.address_space
    }
  }
}

# Outputs pour les Subnets
output "all_subnets" {
  description = "Liste de tous les Subnets créés"
  value = {
    for k, v in azurerm_subnet.subnet :
    k => {
      id                  = v.id
      name                = v.name
      vnet_name           = v.virtual_network_name
      resource_group_name = v.resource_group_name
      address_prefixes    = v.address_prefixes
    }
  }
}
