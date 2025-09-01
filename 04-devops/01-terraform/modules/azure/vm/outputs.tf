# outputs.tf pour le module VM

output "vm_ids" {
  description = "IDs de toutes les machines virtuelles créées"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "vm_names" {
  description = "Noms de toutes les machines virtuelles créées"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.name }
}
