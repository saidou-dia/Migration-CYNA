resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group
  network_interface_ids = each.value.network_interface_ids
  size                = each.value.size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
