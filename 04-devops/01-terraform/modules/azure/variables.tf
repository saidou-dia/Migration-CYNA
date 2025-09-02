variable "vms" {
  description = "Map des VMs à créer"
  type = map(object({
    resource_group        = string
    location              = string
    size                  = string
    admin_username        = string
    admin_password        = string
    network_interface_ids = list(string)
    os_disk_size_gb       = number
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
