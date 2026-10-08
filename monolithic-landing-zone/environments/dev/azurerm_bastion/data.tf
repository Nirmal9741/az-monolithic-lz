data "azurerm_public_ip" "pip" {
  name                = "VM-ip"
  resource_group_name = "tinku-rg"
}

data "azurerm_subnet" "sn" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "tinku-rg"
  virtual_network_name = "VM-VN"
}
