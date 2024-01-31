# Declare Terraform block with required providers and backend configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }

  # Backend configuration for storing Terraform state in Azure
  backend "azurerm" {
    resource_group_name  = "azu-lndevopsd01"
    storage_account_name = "azterraformvmvmss"
    container_name       = "azterraformcontainer"
    key                  = "vm.terraform.tfstate"
  }
}

# Declare Azure provider with specified version and features
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
  resource_name_prefix = format(
    "%s-%s-%s",
    title(local.naming_convention_properties.subscription_name),
    title(local.naming_convention_properties.project_code),
    title(local.naming_convention_properties.environment)
  )
}

# Declare data blocks to retrieve information about Azure resources
data "azurerm_resource_group" "main_resource_group" {
  name = var.main_resource_group_name
}

data "azurerm_subnet" "main_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.subnet_resource_group_name
}

# If public IP is required to be provided to VM, then uncomment below block and provide reference of 
# below resource into VM module block
#
# resource "azurerm_public_ip" "public_ip_basic_sb" {
#   name                = "ado-ref-pub-ip"
#   resource_group_name = data.azurerm_resource_group.main_resource_group.name
#   location            = data.azurerm_resource_group.main_resource_group.location
#   allocation_method   = "Dynamic"  
#   zones               = null
# }

# Declare module for creating a virtual machine
module "virtual_machine" {
  source = "../../../../iac-modules/Infra-As-Code/Modules/terraform/vm"

  # Module Input Variables
  virtual_machine_name                = "${local.resource_name_prefix}-${var.virtual_machine_name}"
  virtual_machine_image_os            = var.virtual_machine_image_os
  virtual_machine_subnet_id           = data.azurerm_subnet.main_subnet.id
  virtual_machine_location            = var.virtual_machine_location
  virtual_machine_resource_group_name = data.azurerm_resource_group.main_resource_group.name
  virtual_machine_size                = var.virtual_machine_size
  zone                                = var.zone
  # allow_extension_operations        = true   # If extension operations are needed, then uncomment it

  # OS Disk Configuration
  virtual_machine_os_disk = {
    name                 = var.virtual_machine_os_disk.name
    caching              = var.virtual_machine_os_disk.caching
    storage_account_type = var.virtual_machine_os_disk.storage_account_type
  }

  # Source Image Reference
  source_image_reference = {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  # Authentication Configuration
  virtual_machine_admin_username                  = var.virtual_machine_admin_username
  virtual_machine_admin_password                  = var.virtual_machine_admin_password
  virtual_machine_disable_password_authentication = false
  
  # Network Interface Configuration
  new_network_interface = {
    name                               = var.new_network_interface.name
    ip_configurations                  = [
      for ip_config in var.new_network_interface.ip_configurations : {
        name                                               = ip_config.name
        private_ip_address                                 = ip_config.private_ip_address
        private_ip_address_version                         = ip_config.private_ip_address_version
        private_ip_address_allocation                      = ip_config.private_ip_address_allocation
        public_ip_address_id                               = ip_config.public_ip_address_id # provide public IP reference here
        primary                                            = ip_config.primary
        gateway_load_balancer_frontend_ip_configuration_id = ip_config.gateway_load_balancer_frontend_ip_configuration_id
      }
    ]
    dns_servers                    = var.new_network_interface.dns_servers
    edge_zone                      = var.new_network_interface.edge_zone
    accelerated_networking_enabled = var.new_network_interface.accelerated_networking_enabled
    ip_forwarding_enabled          = var.new_network_interface.ip_forwarding_enabled
    internal_dns_name_label        = var.new_network_interface.internal_dns_name_label
  }
  
  # Tags for Virtual Machine
  tags = var.tags

  # Extension Operations :- If extension operations are needed then uncomment it (below) and add required values
  #
  # extensions = [
  #   {
  #     name                 = "hostname"
  #     publisher            = "Microsoft.Azure.Extensions"
  #     type                 = "CustomScript"
  #     type_handler_version = "2.0"

  #     settings = <<SETTINGS
  #   {
  #     "commandToExecute": "hostname && uptime"
  #   }
  #   SETTINGS

  #   }
  #   # Add more extension objects if needed
  # ]
}
