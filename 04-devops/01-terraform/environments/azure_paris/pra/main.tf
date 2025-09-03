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

  location       = var.location
  resource_group = var.resource_group

  subnet_virtualinfra_id = module.vnet_paris.subnet_ids["vnet_pra_paris_Subnet-VirtualInfra"]
  subnet_users_id        = module.vnet_paris.subnet_ids["vnet_pra_paris_Subnet-PRA-Users"]
}

# ==============================
# Locals : VM Linux seulement
# ==============================
locals {
  vms = {
    vm1 = {
      name                            = "vm-pra-01"
      size                            = "Standard_B2s"
      os_disk_size_gb                 = 64
      admin_username                  = "saidou"
      disable_password_authentication = true
      admin_ssh_key = {
        username   = "saidou"
        public_key = file("C:/Users/sdia/.ssh/id_rsa_terraform.pub")
      }
      admin_password        = "TempP@ss123!" # requis par Terraform
      location              = var.location
      resource_group        = var.resource_group
      network_interface_ids = [module.nic_pra.nic1_id]
      source_image_reference = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }
    }
  }
}

# ==============================
# VM Module
# ==============================
module "vm_pra" {
  source = "../../../modules/azure/vm"

  vms = local.vms
}

# ==============================
# Outputs
# ==============================
output "nic1_id" { value = module.nic_pra.nic1_id }
output "vm_ids"  { value = module.vm_pra.vm_ids }
