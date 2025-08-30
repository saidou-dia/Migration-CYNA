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

  default = {
    gva_prod = {
      location       = "Switzerland North"
      resource_group = "rg-geneve-prod"
      address_space  = ["10.10.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve", prefix = "10.10.10.0/24", purpose = "Load Balancer / App" },
        { name = "subnet-dmz-geneve",    prefix = "10.10.20.0/24", purpose = "DMZ" }
      ]
    }

    gva_hub = {
      location       = "Switzerland North"
      resource_group = "rg-geneve-hub"
      address_space  = ["10.30.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.30.100.0/24", purpose = "Monitoring" },
        { name = "AzureFirewallSubnet", prefix = "10.30.253.0/26", purpose = "Firewall" }
      ]
    }
  }
}


variable "subscription_id" {
  type        = string
  description = "ID de la subscription Azure"
}

variable "tenant_id" {
  type        = string
  description = "ID du tenant Azure"
}

variable "location_geneve" {
  type        = string
  default     = "Switzerland North"
  description = "Localisation pour Genève"
}

variable "location_paris" {
  type        = string
  default     = "France Central"
  description = "Localisation pour Paris"
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
