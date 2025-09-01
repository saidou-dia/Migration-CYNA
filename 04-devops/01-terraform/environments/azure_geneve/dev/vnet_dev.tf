module "vnet_geneve" {
  source        = "../../../modules/azure/vnet_subnets"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  vnets = {
    vnet_hub_geneve = {
      location       = "Switzerland North"
      resource_group = "rg-geneve-hub"
      address_space  = ["10.30.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.30.100.0/24", purpose = "Monitoring" },
        { name = "Zscaler Tunnel GW",  prefix = "10.30.251.0/28", purpose = "GRE/IPSec" },
        { name = "DNS ResolverSubnet",  prefix = "10.30.252.0/27", purpose = "DNS interne" },
        { name = "AzureFirewallSubnet", prefix = "10.30.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.30.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.30.255.0/27", purpose = "VPN Gateway" }
      ]
    }

    vnet_prod_geneve = {
      location       = "Switzerland North"
      resource_group = "rg-geneve-prod"
      address_space  = ["10.10.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve",      prefix = "10.10.10.0/24", purpose = "App Gateway" },
        { name = "subnet-dmz-geneve",         prefix = "10.10.20.0/24", purpose = "K8s/Web" },
        { name = "subnet-app-geneve",         prefix = "10.10.30.0/24", purpose = "API SaaS" },
        { name = "subnet-db-geneve",          prefix = "10.10.40.0/24", purpose = "DB" },
        { name = "subnet-DevOps-Geneve",      prefix = "10.10.50.0/24", purpose = "DevOps" },
        { name = "subnet-users-geneve",       prefix = "10.10.60.0/24", purpose = "Users" },
        { name = "subnet-admin-geneve",       prefix = "10.10.70.0/24", purpose = "Admin/AD" },
        { name = "subnet-security-geneve",    prefix = "10.10.80.0/24", purpose = "Security" }
      ]
    }

    vnet_pca_geneve = {
      location       = "Switzerland North"
      resource_group = "rg-pca-geneve"
      address_space  = ["10.20.0.0/16"]
      subnets = [
        { name = "Subnet-PCA-Backup",          prefix = "10.20.10.0/24", purpose = "Backup" },
        { name = "Subnet-PCA-SOC",             prefix = "10.20.20.0/24", purpose = "SOC" },
        { name = "Subnet-PCA-AD-Replica",      prefix = "10.20.30.0/24", purpose = "AD Replica" },
        { name = "Subnet-PCA-Storage",         prefix = "10.20.40.0/24", purpose = "Storage" },
        { name = "Subnet-PCA-Virtualisation",  prefix = "10.20.50.0/24", purpose = "VM Arc/Tests" }
      ]
    }
  }
}
