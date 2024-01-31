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

# Main Subnet 
# Which is refered in Network Interface of VMSS resource
variable "main_subnet_name" {
  description = "Name of the main subnet"
  type        = string
}

variable "main_subnet_virtual_network_name" {
  description = "Name of the virtual network containing the main subnet"
  type        = string
}

variable "main_subnet_resource_group_name" {
  description = "Name of the resource group containing the main subnet"
  type        = string
}

# # Exsisting Virtual Machine Image
# variable "main_virtual_machine_image_name" {
#   description = "Name of the virtual machine image"
#   type        = string
# }

# # variable "main_virtual_machine_image_resource_group_name" {
# #   description = "Name of the resource group for the virtual machine image"
# #   type        = string
# # }

variable "main_virtual_machine_image_id" {
  description = "Name of the virtual machine image id"
  type        = string
}


# Virtual Machine Scale Set
variable "virtual_machine_scale_set_name" {
  description = "Name of the virtual machine scale set"
  type        = string
}

variable "os_flavor" {
  description = "Flavor or type of the operating system"
  type        = string
}

variable "vm_sku" {
  description = "Virtual machine SKU"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "instance_count" {
  description = "Number of instances of the virtual machine to create"
  type        = number
}

variable "admin_password" {
  description = "This value represents Admin Password for Virtual Machine Scale Set"
  type        = string
}

variable "vmss_network_interface_name" {
  description = "Name of the network interface for the virtual machine scale set"
  type        = string
}

variable "vmss_network_interface_ip_configuration_name" {
  description = "Name of the IP configuration for the network interface in the virtual machine scale set"
  type        = string
}

variable "disable_password_authentication" {
  description = "Flag to disable password authentication for virtual machines or instances"
  type        = bool
}

variable "vmss_network_interface_dns_servers" {
  description = "DNS servers for the network interface in the virtual machine scale set"
  type        = list(string)
}

variable "vmss_network_interface_enable_ip_forwarding" {
  description = "Flag to enable IP forwarding for the network interface in the virtual machine scale set"
  type        = bool
}

variable "vmss_network_interface_enable_accelerated_networking" {
  description = "Flag to enable accelerated networking for the network interface in the virtual machine scale set"
  type        = bool
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
}

variable "os_disk_caching" {
  description = "Caching settings for the OS disk"
  type        = string
}

variable "identity_type" {
  description = "Type of identity for the virtual machine or virtual machine scale set"
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  description = "Storage account URI for boot diagnostics"
  type        = string
}

variable "secure_boot_enabled" {
  description = "Flag to enable or disable secure boot for the virtual machine or virtual machine scale set"
  type        = bool
}

variable "vtpm_enabled" {
  description = "Flag to enable or disable virtual trusted platform module (vTPM) for the virtual machine or virtual machine scale set"
  type        = bool
}

variable "do_not_run_extensions_on_overprovisioned_machines" {
  description = "Flag to prevent running extensions on overprovisioned machines"
  type        = bool
}




