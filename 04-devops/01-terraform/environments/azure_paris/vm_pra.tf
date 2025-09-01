# VM Module
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

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

