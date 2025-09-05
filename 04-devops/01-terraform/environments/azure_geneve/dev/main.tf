provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

module "vnet_geneve" {
  source = "../../../modules/azure/vnet_subnets"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  vnets = var.vnets
}

module "nic_geneve" {
  source = "../../../modules/azure/nic"
  location = "Switzerland North"
  resource_group = "rg-pca-geneve"
  subnet_virtualinfra_id = module.vnet_geneve.subnet_ids["vnet_pca_geneve_Subnet-PCA-AD-Replica"]
  subnet_users_id = module.vnet_geneve.subnet_ids["vnet_prod_geneve_subnet-DevOps-Geneve"]
}
locals {
  vms = {
    vm1 = {
      resource_group        = "rg-pca-geneve"
      location              = "Switzerland North"
      size                  = "Standard_B2s"
      admin_username        = "saidou"
      disable_password_authentication = true
      admin_ssh_key = {
        username   = "saidou"
        public_key = file("C:/Users/sdia/.ssh/id_rsa_terraform.pub")
      }
      admin_password        = "TempP@ss123!"
      os_disk_size_gb       = 64
      network_interface_ids = [module.nic_geneve.nic1_id]
      source_image_reference = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }
    }
  }
}

module "vm_geneve" {
  source = "../../../modules/azure/vm"
  vms = local.vms
}

output "nic1_id" { value = module.nic_geneve.nic1_id }
output "nic2_id" { value = module.nic_geneve.nic2_id }
output "vm_ids"  { value = module.vm_geneve.vm_ids }
