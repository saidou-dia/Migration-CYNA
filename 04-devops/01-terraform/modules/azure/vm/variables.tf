variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    resource_group                  = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = optional(bool)
    admin_ssh_key                   = optional(object({
      username   = string
      public_key = string
    }))
    network_interface_ids           = list(string)
    os_disk_size_gb                 = number
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
