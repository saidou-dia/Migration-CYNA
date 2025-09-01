variable "vms" {
  description = "Map des VMs à créer"
  type = map(object({
    resource_group = string
    location       = string
    size           = string
    admin_username = string
    admin_password = string
    network_interface_ids = list(string)
  }))
}
