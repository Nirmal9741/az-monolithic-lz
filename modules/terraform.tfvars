# ==============================================================================
# Azure Monolithic Landing Zone - terraform.tfvars.example
# Copy this file to terraform.tfvars and customize with your Azure configurations
# ==============================================================================

# Resource Groups
resource_groups = {
  rg1 = {
    name     = "dev-rg"
    location = "East US"
  }
}

# Virtual Networks
virtual_networks = {
  vnet1 = {
    name                = "dev-vnet"
    resource_group_name = "dev-rg"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
  }
}

# Subnets
subnets = {
  subnet_frontend = {
    name                 = "frontend-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet_bastion = {
    name                 = "AzureBastionSubnet" # Required name for Azure Bastion
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.0.2.0/26"]
  }
}

# Public IP Addresses
public_ips = {
  pip_vm = {
    name                = "VM-pip"
    resource_group_name = "dev-rg"
    location            = "East US"
    allocation_method   = "Static"
  }
  pip_bastion = {
    name                = "bastion-pip"
    resource_group_name = "dev-rg"
    location            = "East US"
    allocation_method   = "Static"
  }
}

# Network Interfaces
network_interfaces = {
  frontend_nic = {
    name                = "frontend-nic"
    resource_group_name = "dev-rg"
    location            = "East US"
  }
  backend_nic = {
    name                = "backend-nic"
    resource_group_name = "dev-rg"
    location            = "East US"
  }
}

# Load Balancers
load_balancers = {
  lb1 = {
    name                = "dev-external-lb"
    resource_group_name = "dev-rg"
    location            = "East US"
  }
}

# Bastion Hosts
bastion_hosts = {
  bastion1 = {
    name                = "dev-bastion"
    resource_group_name = "dev-rg"
    location            = "East US"
  }
}

# Virtual Machines (Frontend & Backend VMs)
virtual_machines = {
  frontend_vm = {
    name                = "frontend-vm"
    resource_group_name = "dev-rg"
    location            = "East US"
    size                = "Standard_B1s"
    admin_username      = "azureuser"
    admin_password      = "AzureDevOps2026!"
    nic_name            = "frontend-nic"
  }
  backend_vm = {
    name                = "backend-vm"
    resource_group_name = "dev-rg"
    location            = "East US"
    size                = "Standard_B1s"
    admin_username      = "azureuser"
    admin_password      = "AzureDevOps2026!"
    nic_name            = "backend-nic"
  }
}
