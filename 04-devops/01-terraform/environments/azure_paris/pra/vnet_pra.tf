module "vnet_paris" {
  source        = "../../../modules/azure/vnet_subnets"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  vnets = {
    vnet_hub_paris = {
      location       = "France Central"
      resource_group = "rg-paris-hub-pra"
      address_space  = ["10.50.0.0/16"]
      subnets = [
        { name = "AzureFirewallSubnet", prefix = "10.50.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.50.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.50.255.0/27", purpose = "VPN Gateway" }
      ]
    }

    vnet_pra_paris = {
      location       = "France Central"
      resource_group = "rg-paris-pra"
      address_space  = ["10.40.0.0/16"]
      subnets = [
        { name = "Subnet-PRA-AD",        prefix = "10.40.10.0/24", purpose = "AD DC, DNS, DHCP" },
        { name = "Subnet-Backup",        prefix = "10.40.11.0/24", purpose = "Veeam / Backup" },
        { name = "Subnet-PRA-FileSync",  prefix = "10.40.20.0/24", purpose = "Azure File Sync" },
        { name = "Subnet-VirtualInfra",  prefix = "10.40.30.0/24", purpose = "Serveurs IaaS / Azure Arc" },
        { name = "Subnet-SIEM-EDR-XDR",  prefix = "10.40.40.0/24", purpose = "Logs / Security" },
        { name = "Subnet-ASR-RecoveryVM",prefix = "10.40.50.0/24", purpose = "VM de récupération ASR" },
        { name = "Subnet-DevOps-SaaS",   prefix = "10.40.60.0/24", purpose = "DevOps / Services SaaS" },
        { name = "Subnet-PRA-Users",     prefix = "10.40.61.0/24", purpose = "Utilisateurs cloud PRA" }
      ]
    }
  }
}
