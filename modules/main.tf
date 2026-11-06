variable "resource_groups" {}
variable "virtual_networks" {}
variable "public_ips" {}
variable "subnets" {}
variable "network_interfaces" {}
variable "load_balancers" {}
variable "bastion_hosts" {}

module "resource_group" {
  source = "../environments/dev/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../environments/dev/azurerm_virtual_network"
  vns        = var.virtual_networks
}

module "public_ip" {
  depends_on = [module.resource_group]
  source = "../environments/dev/azurerm_public_ip"
  pips   = var.public_ips
}

module "subnet" {
  depends_on = [module.virtual_network]
  source  = "../environments/dev/azurerm_subnet"
  subnets = var.subnets
}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source = "../environments/dev/azurerm_network_interface"
  nics   = var.network_interfaces
}

module "load_balancer" {
  depends_on = [module.resource_group]
  source = "../environments/dev/azurerm_lb"
  lbs    = var.load_balancers
}

module "bastion_host" {
  depends_on = [module.subnet, module.public_ip]
  source = "../environments/dev/azurerm_bastion_host"
  bhs    = var.bastion_hosts
}