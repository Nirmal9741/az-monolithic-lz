data "azurerm_public_ip" "pip" {
  name                = "VM-ip"
  resource_group_name = "tinku-rg"
}
