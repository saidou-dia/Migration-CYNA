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

# VNET + Subnets
module "vnet_paris" {
  source = "../../../modules/azure/vnet_subnets"

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  vnets = var.vnets
}

# NICs
module "nic_pra" {
  source = "../../../modules/azure/nic"

  location               = var.location
  resource_group         = var.resource_group
  subnet_virtualinfra_id = module.vnet_paris.all_subnets_flat["vnet_pra_paris_Subnet-VirtualInfra"].id
  subnet_users_id        = module.vnet_paris.all_subnets_flat["vnet_pra_paris_Subnet-PRA-Users"].id
}

# VMs
module "vm_pra" {
  source = "../../../modules/azure/vm"

  vms = {
    vm1 = merge(var.vms["vm1"], {
      network_interface_ids = [module.nic_pra.nic1_id]
    })
    vm2 = merge(var.vms["vm2"], {
      network_interface_ids = [module.nic_pra.nic2_id]
    })
  }
}
