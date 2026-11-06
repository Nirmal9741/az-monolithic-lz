resource "azurerm_bastion_host" "bh" {
  for_each            = var.bhs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.sn.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}         