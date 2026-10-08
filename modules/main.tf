variable "resource_groups" {}
variable "virtual_networks" {}
variable "subnets" {}
variable "public_ips" {}
variable "loadbalancers" {}

module "resource_group" {
  source = "../monolithic-landing-zone/environments/dev/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../monolithic-landing-zone/environments/dev/azurerm_virtual_network"
  vns        = var.virtual_networks
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../monolithic-landing-zone/environments/dev/azurerm_public_ip"
  pips       = var.public_ips
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../monolithic-landing-zone/environments/dev/azurerm_subnet"
  sns        = var.subnets
}

module "lb" {
  depends_on = [module.resource_group, module.public_ip]
  source     = "../monolithic-landing-zone/environments/dev/azurerm_lb"
  lbs        = var.loadbalancers
}
