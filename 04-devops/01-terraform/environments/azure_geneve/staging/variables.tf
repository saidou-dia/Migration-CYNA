variable "locations" {
  description = "Locations des environnements Azure"
  type = map(string)
  default = {
    geneve = "Switzerland North"
  }
}

variable "resource_groups" {
  description = "Resource groups pour l'environnement staging Genève"
  type = map(string)
  default = {
    rg_staging  = "rg-gva-staging-prod"
    rg_hub      = "rg-gva-staging-hub"
    rg_pca      = "rg-gva-staging-pca"
  }
}

variable "vnets" {
  description = "Configuration des VNets et subnets pour staging Genève"
  type = map(any)
  default = {
    pca_gva = {
      address_space = ["10.220.0.0/16"]
      subnets = [
        { name = "Subnet-PCA-Backup",         prefix = "10.220.10.0/24", purpose = "Backup/ASR" },
        { name = "Subnet-PCA-SOC",            prefix = "10.220.20.0/24", purpose = "SIEM/Logs" },
        { name = "Subnet-PCA-AD-Replica",     prefix = "10.220.30.0/24", purpose = "AD Replica" },
        { name = "Subnet-PCA-Storage",        prefix = "10.220.40.0/24", purpose = "Storage" },
        { name = "Subnet-PCA-Virtualisation", prefix = "10.220.50.0/24", purpose = "Azure Arc / PRA Tests" },
      ]
    }

    gva_hub = {
      address_space = ["10.230.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.230.100.0/24", purpose = "Monitoring" },
        { name = "AzureFirewallSubnet", prefix = "10.230.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.230.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.230.255.0/27", purpose = "VPN Gateway" },
      ]
    }

    gva_staging = {
      address_space = ["10.210.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve",    prefix = "10.210.10.0/24", purpose = "Load Balancer / App" },
        { name = "subnet-dmz-geneve",       prefix = "10.210.20.0/24", purpose = "DMZ" },
        { name = "subnet-app-geneve",       prefix = "10.210.30.0/24", purpose = "Applications" },
        { name = "subnet-db-geneve",        prefix = "10.210.40.0/24", purpose = "Databases" },
        { name = "subnet-users-geneve",     prefix = "10.210.60.0/24", purpose = "Users / Workstations" },
        { name = "subnet-admin-geneve",     prefix = "10.210.70.0/24", purpose = "Admin / Management" },
        { name = "subnet-security-geneve",  prefix = "10.210.80.0/24", purpose = "Security / Monitoring" },
      ]
    }
  }
}

variable "tags" {
  description = "Tags à appliquer sur toutes les ressources"
  type = map(string)
  default = {
    environment = "staging"
    owner       = "team-infra"
  }
}
