variable "locations" {
  default = {
    paris = "France Central"
  }
}

locals {
  rg = {
    paris_pra = "rg-paris-pra"
    paris_hub  = "rg-paris-hub"
  }

  vnets = {
    pra_paris = {
      location       = var.locations.paris
      resource_group = local.rg.paris_pra
      address_space  = ["10.40.0.0/16"]
      subnets = [
        { name = "subnet-pra-ad",          prefix = "10.40.10.0/24", purpose = "Active Directory / AD CS / AD FS / DHCP / DNS" },
        { name = "subnet-backup",          prefix = "10.40.11.0/24", purpose = "Backup, Veeam, Azure Backup Vault" },
        { name = "subnet-pra-filesync",    prefix = "10.40.20.0/24", purpose = "Azure File Sync" },
        { name = "subnet-virtualinfra",    prefix = "10.40.30.0/24", purpose = "VMs, Azure Arc, serveurs" },
        { name = "subnet-siem-edr-xdr",    prefix = "10.40.40.0/24", purpose = "Logs, alertes" },
        { name = "subnet-asr-recoveryvm",  prefix = "10.40.50.0/24", purpose = "Machines virtuelles ASR" },
        { name = "subnet-devops-saas",     prefix = "10.40.60.0/24", purpose = "Services DevOps et SaaS" },
        { name = "subnet-pra-users",       prefix = "10.40.61.0/24", purpose = "Postes utilisateurs" }
      ]
    }

    hub_paris = {
      location       = var.locations.paris
      resource_group = local.rg.paris_hub
      address_space  = ["10.50.0.0/16"]
      subnets = [
        { name = "azurefirewallsubnet", prefix = "10.50.253.0/26", purpose = "Azure Firewall" },
        { name = "azurebastionsubnet",  prefix = "10.50.254.0/27", purpose = "Azure Bastion" },
        { name = "gatewaysubnet",       prefix = "10.50.255.0/27", purpose = "VPN Gateway" }
      ]
    }
  }
}
