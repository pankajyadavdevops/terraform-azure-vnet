provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "https://github.com/pankajyadavdevops/terraform-azure-resource-group.git"
  version     = "1.0.2"
  name        = "app2"
  environment = "test"
  location    = "North Europe"
}

module "vnet" {
  source                 = "./../../."
  name                   = "app-vnet"
  environment            = "test"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  address_spaces         = ["10.0.0.0/16"]
  existing_ddos_pp       = "/subscriptions/subscriptions_id/resourceGroups/app-test-resource-group/providers/Microsoft.Network/ddosProtectionPlans/app-vnet-test-ddospp"
  enable_network_watcher = false
}
