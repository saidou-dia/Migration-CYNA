variable "vms" {
  description = "Map des VMs à créer"
  type = map(object({
    size                   = string
    admin_username         = string
    admin_password         = string
    location               = string
    resource_group         = string
    network_interface_ids  = list(string)
    os_disk_size_gb        = number
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
