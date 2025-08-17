variable "locations" {
  description = "Locations des environnements Azure"
  type = map(string)
  default = {
    geneve = "Switzerland North"
  }
}

variable "resource_groups" {
  description = "Resource groups pour l'environnement dev Genève"
  type = map(string)
  default = {
    rg_dev  = "rg-gva-dev-prod"
    rg_hub  = "rg-gva-dev-hub"
    rg_pca  = "rg-gva-dev-pca"
  }
}

variable "vnets" {
  description = "Configuration des VNets et subnets pour dev Genève"
  type = map(any)
  default = {
    pca_gva = {
      address_space = ["10.120.0.0/16"]
      subnets = [
        { name = "Subnet-PCA-Backup",         prefix = "10.120.10.0/24", purpose = "Backup/ASR" },
        { name = "Subnet-PCA-SOC",            prefix = "10.120.20.0/24", purpose = "SIEM/Logs" },
        { name = "Subnet-PCA-AD-Replica",     prefix = "10.120.30.0/24", purpose = "AD Replica" },
        { name = "Subnet-PCA-Storage",        prefix = "10.120.40.0/24", purpose = "Storage" },
        { name = "Subnet-PCA-Virtualisation", prefix = "10.120.50.0/24", purpose = "Azure Arc/Tests PRA" },
      ]
    }

    gva_hub = {
      address_space = ["10.130.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.130.100.0/24", purpose = "Monitoring" },
        { name = "AzureFirewallSubnet", prefix = "10.130.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.130.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.130.255.0/27", purpose = "VPN Gateway" },
      ]
    }

    gva_dev = {
      address_space = ["10.110.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve",    prefix = "10.110.10.0/24", purpose = "Load Balancer / App" },
        { name = "subnet-dmz-geneve",       prefix = "10.110.20.0/24", purpose = "DMZ" },
        { name = "subnet-app-geneve",       prefix = "10.110.30.0/24", purpose = "Applications" },
        { name = "subnet-db-geneve",        prefix = "10.110.40.0/24", purpose = "Databases" },
        { name = "subnet-users-geneve",     prefix = "10.110.60.0/24", purpose = "Users / Workstations" },
        { name = "subnet-admin-geneve",     prefix = "10.110.70.0/24", purpose = "Admin / Management" },
        { name = "subnet-security-geneve",  prefix = "10.110.80.0/24", purpose = "Security / Monitoring" },
      ]
    }
  }
}

variable "tags" {
  description = "Tags à appliquer sur toutes les ressources"
  type = map(string)
  default = {
    environment = "dev"
    owner       = "team-infra"
  }
}
