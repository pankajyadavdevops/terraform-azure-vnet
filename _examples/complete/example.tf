provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "https://github.com/pankajyadavdevops/terraform-azure-resource-group.git"
  version     = "1.0.2"
  name        = "app"
  environment = "test"
  location    = "North Europe"
}


module "vnet" {
  source                 = "./../../."
  name                   = "app-vnet"
  environment            = "test"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  address_space          = "10.0.0.0/16"
  enable_ddos_pp         = false
  enable_network_watcher = false
}
