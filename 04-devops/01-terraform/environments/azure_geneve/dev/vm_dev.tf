module "vm_geneve" {
  source = "../../../modules/azure/vm"

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  vms = {
    vm1 = {
      resource_group        = "rg-pca-geneve"
      location              = "Switzerland North"
      size                  = "Standard_B2s"
      admin_username        = "adminuser"
      admin_password        = "Password123!"
      network_interface_ids = [module.vnet_geneve.nic_ids["vnet_pca_geneve_Subnet-PCA-AD-Replica"]]
    }
    vm2 = {
      resource_group        = "rg-pca-geneve"
      location              = "Switzerland North"
      size                  = "Standard_B2s"
      admin_username        = "adminuser"
      admin_password        = "Password123!"
      network_interface_ids = [module.vnet_geneve.nic_ids["vnet_prod_geneve_subnet-DevOps-Geneve"]]
    }
  }
}
