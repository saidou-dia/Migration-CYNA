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

 subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  vnets  = var.vnets
}

# ==============================
# NIC Module
# ==============================
module "nic_pra" {
  source = "../../../modules/azure/nic"
  location               = var.location
  resource_group         = var.resource_group
  subnet_virtualinfra_id = module.vnet_paris.subnet_ids["vnet_pra_paris_Subnet-VirtualInfra"]
  subnet_users_id        = module.vnet_paris.subnet_ids["vnet_pra_paris_Subnet-PRA-Users"]
}

# ==============================
# VM Module
# ==============================
module "vm_pra" {
  source = "../../../modules/azure/vm"

  vms = {
    vm1 = merge(var.vms["vm1"], { network_interface_ids = [module.nic_pra.nic1_id] })
    vm2 = merge(var.vms["vm2"], { network_interface_ids = [module.nic_pra.nic2_id] })
  }
}

# ==============================
# Outputs
# ==============================
output "nic1_id" { value = module.nic_pra.nic1_id }
output "nic2_id" { value = module.nic_pra.nic2_id }
output "vm_ids" { value = module.vm_pra.vm_ids }


