variable "locations" {
  description = "Locations des environnements Azure"
  type = map(string)
  default = {
    geneve = "Switzerland North"
  }
}

variable "resource_groups" {
  description = "Resource groups pour l'environnement prod Genève"
  type = map(string)
  default = {
    rg_prod = "rg-gva-prod-prod"
    rg_hub  = "rg-gva-prod-hub"
    rg_pca  = "rg-gva-pca"
  }
}

variable "vnets" {
  description = "Configuration des VNets et subnets pour prod Genève"
  type = map(any)
  default = {
    pca_gva = {
      address_space = ["10.20.0.0/16"]
      subnets = [
        { name = "Subnet-PCA-Backup",         prefix = "10.20.10.0/24", purpose = "Backup/ASR" },
        { name = "Subnet-PCA-SOC",            prefix = "10.20.20.0/24", purpose = "SIEM/Logs" },
        { name = "Subnet-PCA-AD-Replica",     prefix = "10.20.30.0/24", purpose = "AD Replica" },
        { name = "Subnet-PCA-Storage",        prefix = "10.20.40.0/24", purpose = "Storage" },
        { name = "Subnet-PCA-Virtualisation", prefix = "10.20.50.0/24", purpose = "Azure Arc/Tests PRA" },
      ]
    }

    gva_hub = {
      address_space = ["10.30.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.30.100.0/24", purpose = "Monitoring" },
        { name = "AzureFirewallSubnet", prefix = "10.30.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.30.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.30.255.0/27", purpose = "VPN Gateway" },
      ]
    }

    gva_prod = {
      address_space = ["10.10.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve",    prefix = "10.10.10.0/24", purpose = "Load Balancer / App" },
        { name = "subnet-dmz-geneve",       prefix = "10.10.20.0/24", purpose = "DMZ" },
        { name = "subnet-app-geneve",       prefix = "10.10.30.0/24", purpose = "Applications" },
        { name = "subnet-db-geneve",        prefix = "10.10.40.0/24", purpose = "Databases" },
        { name = "subnet-users-geneve",     prefix = "10.10.60.0/24", purpose = "Users / Workstations" },
        { name = "subnet-admin-geneve",     prefix = "10.10.70.0/24", purpose = "Admin / Management" },
        { name = "subnet-security-geneve",  prefix = "10.10.80.0/24", purpose = "Security / Monitoring" },
      ]
    }
  }
}

variable "tags" {
  description = "Tags à appliquer sur toutes les ressources"
  type = map(string)
  default = {
    environment = "prod"
    owner       = "team-infra"
  }
}
