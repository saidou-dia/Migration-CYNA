# ==============================
# Provider Azure
# ==============================
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# ==============================
# VNET + Subnets Module
# ==============================
module "vnet_paris" {
  source = "../../../modules/azure/vnet_subnets"

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
        { name = "Subnet-VirtualInfra",  prefix = "10.40.30.0/24", purpose = "Serveurs IaaS / Azure Arc" },
        { name = "Subnet-PRA-Users",     prefix = "10.40.61.0/24", purpose = "Utilisateurs cloud PRA" }
      ]
    }
  }
}

# ==============================
# NIC Module
# ==============================
module "nic_pra" {
  source = "../../../modules/azure/nic"

  location               = var.location
  resource_group         = var.resource_group
  subnet_virtualinfra_id = module.vnet_paris.all_subnets_flat["vnet_pra_paris_Subnet-VirtualInfra"].id
  subnet_users_id        = module.vnet_paris.all_subnets_flat["vnet_pra_paris_Subnet-PRA-Users"].id
}

# ==============================
# VM Module
# ==============================
module "vm_pra" {
  source = "../../../modules/azure/vm"

  vms = {
    vm1 = {
      resource_group        = var.resource_group
      location              = var.location
      size                  = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "MotDePasseComplexe123!"
      network_interface_ids = [module.nic_pra.nic1_id]
    }
    vm2 = {
      resource_group        = var.resource_group
      location              = var.location
      size                  = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "MotDePasseComplexe123!"
      network_interface_ids = [module.nic_pra.nic2_id]
    }
  }
}

# ==============================
# Outputs
# ==============================
output "nic1_id" {
  description = "ID de la première NIC"
  value       = module.nic_pra.nic1_id
}

output "nic2_id" {
  description = "ID de la deuxième NIC"
  value       = module.nic_pra.nic2_id
}

output "vm1_id" {
  description = "ID de la VM1"
  value       = module.vm_pra.vms["vm1"].id
}

output "vm2_id" {
  description = "ID de la VM2"
  value       = module.vm_pra.vms["vm2"].id
}
