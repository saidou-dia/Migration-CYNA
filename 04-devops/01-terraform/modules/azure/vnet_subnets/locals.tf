locals {
  all_subnets_flat = {
    for s in flatten([
      for vnet_name, vnet in var.vnets : [
        for subnet in vnet.subnets : {
          key        = "${vnet_name}_${subnet.name}"
          vnet_name  = vnet_name
          subnet_name= subnet.name
          prefix     = subnet.prefix
        }
      ]
    ]) : s.key => {
      vnet_name   = s.vnet_name
      subnet_name = s.subnet_name
      prefix      = s.prefix
    }
  }
}
