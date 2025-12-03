provider "azurerm" {
  features {}
  subscription_id = "1ac2caa4-336e-4daa-b8f1-0fbabe2d4b11"
}

##-----------------------------------------------------------------------------
## Resource Group module call.
##-----------------------------------------------------------------------------
module "resource_group" {
  source  = "terraform-az-modules/resource-group/azurerm"
  version = "1.0.3"
  name        = var.name
  environment = "test"
  location    = "northeurope"
  label_order = ["name", "environment", "location"] # locations logic are pre configured in the labels module
  # custom_name             = "" # Optional: Overrides default naming logic with a fully custom name. Cannot be used if `name` is set.
  resource_position_prefix = true # If true, resource type prefix (e.g., rg, rg-lock) is prepended to the name. Otherwise, it's appended.

  #resource lock
  resource_lock_enabled = true
  lock_level            = "CanNotDelete"
}

variable "name" {
}