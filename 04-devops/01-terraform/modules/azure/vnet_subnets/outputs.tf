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

output "subnet_ids" {
  description = "Map des IDs des subnets créés"
  value = { for k, s in azurerm_subnet.subnet : k => s.id }
}
