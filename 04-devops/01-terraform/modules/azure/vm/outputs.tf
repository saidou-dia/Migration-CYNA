# outputs.tf pour le module VM

output "vm_ids" { value = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id } }