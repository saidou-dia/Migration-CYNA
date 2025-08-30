locals {
  rg = {
    gva_prod  = "rg-geneve-prod"
    gva_hub   = "rg-geneve-hub"
    paris_prod = "rg-paris-pra"
    paris_hub  = "rg-paris-hub"
  }

  vnets = {
    # =========================
    # Genève - Production
    # =========================
    gva_prod = {
      location       = var.locations.geneve
      resource_group = local.rg.gva_prod
      address_space  = ["10.10.0.0/16"]
      subnets = [
        { name = "subnet-lb-app-geneve", prefix = "10.10.10.0/24", purpose = "Load Balancer / App" },
        { name = "subnet-dmz-geneve",    prefix = "10.10.20.0/24", purpose = "DMZ" },
        { name = "subnet-app-geneve",    prefix = "10.10.30.0/24", purpose = "Applications" },
        { name = "subnet-db-geneve",     prefix = "10.10.40.0/24", purpose = "Databases" },
        { name = "subnet-users-geneve",  prefix = "10.10.60.0/24", purpose = "Users / Workstations" },
        { name = "subnet-admin-geneve",  prefix = "10.10.70.0/24", purpose = "Admin / Management" },
        { name = "subnet-security-geneve", prefix = "10.10.80.0/24", purpose = "Security / Monitoring" }
      ]
    }

    # =========================
    # Genève - Hub
    # =========================
    gva_hub = {
      location       = var.locations.geneve
      resource_group = local.rg.gva_hub
      address_space  = ["10.30.0.0/16"]
      subnets = [
        { name = "MonitoringSubnet",    prefix = "10.30.100.0/24", purpose = "Monitoring" },
        { name = "AzureFirewallSubnet", prefix = "10.30.253.0/26", purpose = "Firewall" },
        { name = "AzureBastionSubnet",  prefix = "10.30.254.0/27", purpose = "Bastion" },
        { name = "GatewaySubnet",       prefix = "10.30.255.0/27", purpose = "VPN Gateway" }
      ]
    }

    # =========================
    # Genève - PCA
    # =========================
    pca_gva = {
      location       = var.locations.geneve
      resource_group = local.rg.gva_prod
      address_space  = ["10.20.0.0/16"]
      subnets = [
        { name = "Subnet-PCA-Backup",         prefix = "10.20.10.0/24", purpose = "Backup/ASR" },
        { name = "Subnet-PCA-SOC",            prefix = "10.20.20.0/24", purpose = "SIEM/Logs" },
        { name = "Subnet-PCA-AD-Replica",     prefix = "10.20.30.0/24", purpose = "AD Replica" },
        { name = "Subnet-PCA-Storage",        prefix = "10.20.40.0/24", purpose = "Storage" },
        { name = "Subnet-PCA-Virtualisation", prefix = "10.20.50.0/24", purpose = "Azure Arc/Tests PRA" }
      ]
    }

    # =========================
    # Paris - PRA
    # =========================
    pra_paris = {
      location       = var.locations.paris
      resource_group = local.rg.paris_prod
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

    # =========================
    # Paris - Hub
    # =========================
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

  # Flatten all subnets into a single map pour utilisation dans main.tf
  all_subnets = merge([
    for vnet_name, vnet in local.vnets : {
      for subnet in vnet.subnets : 
      "${vnet_name}_${subnet.name}" => {
        vnet_name  = vnet_name
        rg_name    = vnet.resource_group
        subnet_name = subnet.name
        prefix     = subnet.prefix
        purpose    = subnet.purpose
        location   = vnet.location
      }
    }
  ]...)
}
