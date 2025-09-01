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

  vnets = var.vnets
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

  vms = var.vms
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
