provider "azurerm" {
  features {}
}


locals {
  name        = "dev"
  environment = "test"
}

## Resource Group

module "resource_group" {
  source      = "git::https://github.com/opsstation/terraform-azure-resource-group.git?ref=v1.0.0"
  name        = local.name
  environment = local.environment
  location    = "Canada Central"
}

module "vnet" {
  source              = "git::https://github.com/opsstation/terraform-azure-vnet.git?ref=v1.0.0"
  name                = local.name
  environment         = local.environment
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

module "subnet" {
  source               = "git::https://github.com/opsstation/terraform-azure-subnet.git?ref=v1.0.1"
  name                 = local.name
  environment          = local.environment
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = join("", module.vnet[*].vnet_name)
  #subnet
  subnet_names    = ["subnet1"]
  subnet_prefixes = ["10.0.1.0/24"]
  # route_table
  enable_route_table = true
  route_table_name   = "default_subnet"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}

module "data_factory" {
  depends_on = [
    module.resource_group
  ]
  source = "../."

  name                = "app"
  environment         = "test"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

}
