# -----------------------------
# VNETs créés
# -----------------------------
output "vnets" {
  description = "Liste des VNETs créés avec leur ID"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

output "vnets_names" {
  description = "Noms des VNETs"
  value       = [for v in azurerm_virtual_network.vnet : v.name]
}

output "vnets_address_spaces" {
  description = "Adresse IP de chaque VNET"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.address_space }
}

# -----------------------------
# Subnets créés
# -----------------------------
output "subnets" {
  description = "Liste des subnets créés avec leur ID"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnets_names" {
  description = "Noms des subnets"
  value       = [for v in azurerm_subnet.subnet : v.name]
}

output "subnets_addresses" {
  description = "Adresse IP de chaque subnet"
  value       = { for k, v in azurerm_subnet.subnet : k => v.address_prefixes[0] }
}

output "subnets_vnets" {
  description = "VNET associé à chaque subnet"
  value       = { for k, v in azurerm_subnet.subnet : k => v.virtual_network_name }
}

# -----------------------------
# Resource Groups
# -----------------------------
output "resource_groups" {
  description = "Resource groups utilisés pour chaque VNET"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.resource_group_name }
}

output "subnets_resource_groups" {
  description = "Resource groups utilisés pour chaque subnet"
  value       = { for k, v in azurerm_subnet.subnet : k => v.resource_group_name }
}
