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
  description = "Map des VMs à créer"
  type        = map(any)
  default     = {}
}

