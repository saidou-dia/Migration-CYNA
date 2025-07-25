resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
  name                = "ad-azure-vpn"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  type                        = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.main.id
  local_network_gateway_id   = azurerm_local_network_gateway.main.id
  shared_key                 = "YourSharedKeyHere"
}