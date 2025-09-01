# NIC Module
module "nic_pra" {
  source = "../../../modules/azure/nic"

  location               = var.location
  resource_group         = var.resource_group
  subnet_virtualinfra_id = var.subnet_virtualinfra_id
  subnet_users_id        = var.subnet_users_id

}


 subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret