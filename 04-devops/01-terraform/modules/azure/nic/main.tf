resource "azurerm_network_interface" "nic1" {
  name                = "nic1"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_virtualinfra_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "nic2"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_users_id
    private_ip_address_allocation = "Dynamic"
  }
}
