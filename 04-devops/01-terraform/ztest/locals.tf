locals {
  # ----------------------------
  # VNETs à partir des variables
  # ----------------------------
  vnets = {
    for vnet_key, vnet_value in var.subnets :
    vnet_key => {
      location       = vnet_value.location
      resource_group = vnet_value.resource_group
      address_space  = vnet_value.address_space
      subnets        = vnet_value.subnets
    }
  }

  # ----------------------------
  # Aplatir tous les subnets pour le for_each
  # ----------------------------
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
