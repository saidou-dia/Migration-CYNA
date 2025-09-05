resource "azurerm_linux_virtual_machine" "vm_vvm1_pra" {
  name                = "vm-vm1"
  resource_group_name = "RG-PARIS-PRA"
  location            = "francecentral"
  size                = "Standard_B2s"

  admin_username = "saidou"
  admin_password = "TempP@ss123!" # obligatoire pour Terraform

  network_interface_ids = [
    "/subscriptions/942fcfd7-5124-4c23-9165-795253618555/resourceGroups/RG-PARIS-PRA/providers/Microsoft.Network/networkInterfaces/nic1"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
