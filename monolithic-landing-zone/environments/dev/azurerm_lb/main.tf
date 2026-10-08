resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  frontend_ip_configuration {
    name                 = each.value.ip_name
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}
