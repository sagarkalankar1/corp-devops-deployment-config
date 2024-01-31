# variables.tf

# local
variable "naming_convention_properties" {
  description = "Properties for naming convention"
  type = object({
    subscription_name = string
    project_code      = string
    environment       = string
  })
}

# Main Resource Group
variable "main_resource_group_name" {
  description = "Main Resource Group Name in which VMSS resource is deployed"
  type        = string
}

# Subnet 
# Which is refered in Network Interface of VM resource
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network containing the subnet"
  type        = string
}

variable "subnet_resource_group_name" {
  description = "Name of the resource group containing the main subnet"
  type        = string
}

# Referance Virtual Machine
variable "virtual_machine_name" {
  description = "Name for the virtual machine"
  type        = string
}

variable "virtual_machine_image_os" {
  description = "Operating system image for the virtual machine"
  type        = string
}

variable "virtual_machine_location" {
  description = "Location/region where the virtual machine should be created"
  type        = string
}

variable "virtual_machine_resource_group_name" {
  description = "Name of the resource group where the virtual machine should be created"
  type        = string
}

variable "virtual_machine_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "zone" {
  description = "Defines the zone where the virtual machine is to be placed"
  type        = number
  default     = null
}

variable "allow_extension_operations" {
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine? Defaults to `false`."
  type        = bool
  default     = false
  
}

variable "virtual_machine_os_disk" {
  description = "Configuration for the OS disk"
  type = object({
    name                 = string
    caching              = string
    storage_account_type = string
  })
}

variable "source_image_reference" {
  description = "Reference to the source image for the virtual machine"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "virtual_machine_admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "virtual_machine_admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
}

variable "new_network_interface" {
  description = "New Network Interface that should be created and attached to this Virtual Machine. Cannot be used along with `network_interface_ids`"
  type = object({
    name = optional(string)
    ip_configurations = list(object({
      name                                               = optional(string)
      private_ip_address                                 = optional(string)
      private_ip_address_version                         = optional(string, "IPv4")
      private_ip_address_allocation                      = optional(string, "Dynamic")
      public_ip_address_id                               = optional(string)
      primary                                            = optional(bool, false)
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    }))
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    accelerated_networking_enabled = optional(bool, false)
    ip_forwarding_enabled          = optional(bool, false)
    internal_dns_name_label        = optional(string)
  })
  default = {
    name = null
    ip_configurations = [
      {
        name                                               = null
        private_ip_address                                 = null
        private_ip_address_version                         = null
        public_ip_address_id                               = null
        private_ip_address_allocation                      = null
        primary                                            = true
        gateway_load_balancer_frontend_ip_configuration_id = null
      }
    ]
    dns_servers                    = null
    edge_zone                      = null
    accelerated_networking_enabled = null
    ip_forwarding_enabled          = null
    internal_dns_name_label        = null
  }
}

variable "extensions" {
  description = "Argument to create `azurerm_virtual_machine_extension` resource, the argument descriptions could be found at [the document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension)."
  type = set(object({
    name                        = string
    publisher                   = string
    type                        = string
    type_handler_version        = string
    auto_upgrade_minor_version  = optional(bool)
    automatic_upgrade_enabled   = optional(bool)
    failure_suppression_enabled = optional(bool, false)
    settings                    = optional(string)
    protected_settings          = optional(string)
    protected_settings_from_key_vault = optional(object({
      secret_url      = string
      source_vault_id = string
    }))
  }))
  # tflint-ignore: terraform_sensitive_variable_no_default
  default     = []
}

variable "tags" {
  description = "A map of the tags to use on the resources that are deployed with this module."
  type        = map(string)
}
