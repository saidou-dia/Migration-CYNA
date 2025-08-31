module "vm_pra" {
  source = "../../../modules/azure/vm"

  vms = {
    vm1 = {
      resource_group        = "rg-paris-pra"
      location              = "France Central"
      size                  = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "MotDePasseComplexe123!"
      network_interface_ids = [module.nic_pra.nic_id1]
    }

    vm2 = {
      resource_group        = "rg-paris-pra"
      location              = "France Central"
      size                  = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "MotDePasseComplexe123!"
      network_interface_ids = [module.nic_pra.nic_id2]
    }
  }
}

resource "azurerm_network_interface" "nic1" {
  name                = "nic1"
  location            = "France Central"
  resource_group_name = "rg-paris-pra"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet_pra.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "nic2"
  location            = "France Central"
  resource_group_name = "rg-paris-pra"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet_pra.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}