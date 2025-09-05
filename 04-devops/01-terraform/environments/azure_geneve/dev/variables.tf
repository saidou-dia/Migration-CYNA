variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "vnets" {
  description = "Map des VNETs à créer"
  type = map(object({
    location       = string
    resource_group = string
    address_space  = list(string)
    subnets = list(object({
      name    = string
      prefix  = string
      purpose = string
    }))
  }))
}

variable "vms" {
  type = map(object({
    resource_group                  = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string # <-- ici
    disable_password_authentication = bool
    admin_ssh_key                   = any
    os_disk_size_gb                 = number
    source_image_reference          = any
  }))
  default = {}
}
