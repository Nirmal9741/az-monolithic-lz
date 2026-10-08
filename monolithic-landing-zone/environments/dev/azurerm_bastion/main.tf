resource "azurerm_bastion_host" "bs" {
  for_each            = var.bs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = data.azurerm_subnet.sn.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}
