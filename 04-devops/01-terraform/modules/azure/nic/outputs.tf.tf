output "nic1_id" {
  description = "ID de la première NIC"
  value       = azurerm_network_interface.nic1.id
}

output "nic2_id" {
  description = "ID de la deuxième NIC"
  value       = azurerm_network_interface.nic2.id
}
