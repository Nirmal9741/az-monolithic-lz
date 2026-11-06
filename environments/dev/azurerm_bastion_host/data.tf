data "azurerm_subnet" "sn" {
  name                 = "frontend-subnet"
  resource_group_name  = "dev-rg"
  virtual_network_name = "dev-vnet"
}

data "azurerm_public_ip" "pip" {
  name                = "VM-pip"
  resource_group_name = "dev-rg"
}