resource "azuread_connect_sync" "example" {
  name               = "ADConnectSync"
  location           = "West Europe"
  resource_group     = "rg-cyna-ad"
  sync_rule_enabled  = true
}