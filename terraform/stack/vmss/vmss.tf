terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azu-lndevopsd01"
    storage_account_name = "azterraformvmvmss"
    container_name       = "azterraformcontainer"
    key                  = "vmss.terraform.tfstate"
  }
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
  resource_name_prefix = format("%s-%s-%s", title(local.naming_convention_properties.subscription_name), title(local.naming_convention_properties.project_code), title(local.naming_convention_properties.environment))
}

data "azurerm_resource_group" "main_resource_group" {
  name = var.main_resource_group_name
}

data "azurerm_subnet" "main_subnet" {
  name                 = var.main_subnet_name
  virtual_network_name = var.main_subnet_virtual_network_name
  resource_group_name  = var.main_subnet_resource_group_name
}

data "azurerm_virtual_machine" "ref_virtual_machine" {
  name                = var.ref_virtual_machine_name
  resource_group_name = data.azurerm_resource_group.main_resource_group.name
}

module "virtual_machine_scale_set" {
  source = "../../../../iac-modules/Infra-As-Code/Modules/terraform/vmss"

  # Null Resource
  virtual_machine_id     = data.azurerm_virtual_machine.ref_virtual_machine.id
  vm_resource_group_name = data.azurerm_resource_group.main_resource_group.name
  virtual_machine_name   = data.azurerm_virtual_machine.ref_virtual_machine.name

  #VM Image
  vm_image_name                = "${local.resource_name_prefix}-${var.vm_image_name}"
  vm_image_location            = data.azurerm_resource_group.main_resource_group.location
  vm_image_resource_group_name = data.azurerm_resource_group.main_resource_group.name

  # VMSS
  virtual_machine_scale_set_name  = "${local.resource_name_prefix}-${var.virtual_machine_scale_set_name}"
  resource_group_name             = data.azurerm_resource_group.main_resource_group.name
  os_flavor                       = var.os_flavor
  location                        = data.azurerm_resource_group.main_resource_group.location
  vm_sku                          = var.vm_sku
  admin_username                  = var.admin_username
  instance_count                  = var.instance_count
  admin_password                  = var.admin_password
  disable_password_authentication = var.disable_password_authentication

  network_interface = {
    name    = "${local.resource_name_prefix}-${var.vmss_network_interface_name}"
    primary = true
    ip_configuration = {
      name      = var.vmss_network_interface_ip_configuration_name
      subnet_id = data.azurerm_subnet.main_subnet.id
      primary   = true
    }
    dns_servers                   = var.vmss_network_interface_dns_servers
    enable_ip_forwarding          = var.vmss_network_interface_enable_ip_forwarding
    enable_accelerated_networking = var.vmss_network_interface_enable_accelerated_networking
  }

  os_disk = {
    storage_account_type = var.os_disk_storage_account_type
    caching              = var.os_disk_caching
  }

  identity = {
    type = var.identity_type
  }

  boot_diagnostics = {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  secure_boot_enabled                               = var.secure_boot_enabled
  vtpm_enabled                                      = var.vtpm_enabled
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
}
