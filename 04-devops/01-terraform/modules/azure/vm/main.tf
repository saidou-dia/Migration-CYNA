resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                = "vm-${each.key}"
  resource_group_name = each.value.resource_group
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = each.value.network_interface_ids

  admin_password = each.value.admin_password  # nécessaire pour Terraform

  # Bloc SSH dynamique
  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_key != null ? [each.value.admin_ssh_key] : []
    content {
      username   = admin_ssh_key.value.username
      public_key = admin_ssh_key.value.public_key
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = each.value.os_disk_size_gb
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
