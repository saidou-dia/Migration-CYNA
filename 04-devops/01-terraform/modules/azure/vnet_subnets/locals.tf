locals {
  vnets = var.vnets

  # Flatten des subnets en map avec clé unique
  all_subnets_flat = merge([
    for vnet_name, vnet in local.vnets : {
      for s in vnet.subnets : "${vnet_name}_${s.name}" => {
        subnet_name = s.name
        prefix      = s.prefix
        purpose     = s.purpose
        vnet_name   = vnet_name
      }
    }
  ]...)
}
