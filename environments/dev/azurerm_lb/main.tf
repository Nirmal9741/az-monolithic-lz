resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.name 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}