variable "subnets" {
  description = "Subnets par VNET"
  type = map(object({
    location       = string
    resource_group = string
    address_space  = list(string)
    subnets        = list(object({
      name    = string
      prefix  = string
      purpose = string
    }))
  }))
}

variable "subscription_id" {
  type        = string
  description = "ID de la subscription Azure"
}

variable "tenant_id" {
  type        = string
  description = "ID du tenant Azure"
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (App ID)"
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret"
  sensitive   = true
}
