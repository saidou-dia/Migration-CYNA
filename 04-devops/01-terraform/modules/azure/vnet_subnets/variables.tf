variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

variable "vnets" {
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
