terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "azu-lndevopsd01"
  #   storage_account_name = "azterraformvmvmss"
  #   container_name       = "azterraformcontainer"
  #   key                  = "sa.terraform.tfstate"
  # }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

locals {
  naming_convention_properties = {
    subscription_name = var.naming_convention_properties.subscription_name
    project_code      = var.naming_convention_properties.project_code
    environment       = var.naming_convention_properties.environment
  }
  resource_name_prefix = format("%s%s%s", title(local.naming_convention_properties.subscription_name), title(local.naming_convention_properties.project_code), title(local.naming_convention_properties.environment))
}

data "azurerm_resource_group" "main_resource_group" {
  name = var.main_resource_group_name
}

# data "azurerm_subnet" "main_subnet" {
#   name                 = var.main_subnet_name
#   virtual_network_name = var.main_subnet_virtual_network_name
#   resource_group_name  = var.main_subnet_resource_group_name
# }

module "storage_account" {
  source = "../../../../iac-modules/Infra-As-Code/Modules/terraform/storageAccount"

  storage_account_name                          = lower("${local.resource_name_prefix}${var.storage_account_resource_name}")
  resource_group_name                           = data.azurerm_resource_group.main_resource_group.name
  location                                      = data.azurerm_resource_group.main_resource_group.location
  storage_account_account_tier                  = var.storage_account_account_tier
  storage_account_account_replication_type      = var.storage_account_account_replication_type
  storage_account_public_network_access_enabled = var.storage_account_public_network_access_enabled
  storage_account_account_kind                  = var.storage_account_account_kind

  storage_account_identity = {
    type = var.storage_account_identity.type
  }

  containers = var.containers

  create_private_endpoints = var.create_private_endpoints 

  private_endpoint_subnet_id = null

  # private_endpoints = var.private_endpoints
}
