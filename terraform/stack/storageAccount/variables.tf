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
  description = "Main Resource Group Name in which resource is deployed"
  type        = string
}

# Main Subnet 
# Which is refered in Network Interface of Storage Account resource
# variable "main_subnet_name" {
#   description = "Name of the main subnet"
#   type        = string
# }

# variable "main_subnet_virtual_network_name" {
#   description = "Name of the virtual network containing the main subnet"
#   type        = string
# }

# variable "main_subnet_resource_group_name" {
#   description = "Name of the resource group containing the main subnet"
#   type        = string
# }

# Storage Account
variable "storage_account_resource_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "storage_account_account_replication_type" {
  description = "Storage account replication type"
  type        = string
}

variable "storage_account_public_network_access_enabled" {
  description = "Flag to enable or disable public network access to the storage account"
  type        = bool
}

variable "storage_account_account_kind" {
  description = "Storage account kind"
  type        = string
}

variable "storage_account_identity" {
  description = "Identity configuration for the storage account."
  type = object({
    type = string
  })
}

# Storage Account Container
variable "containers" {
  description = "List of containers to create and their access levels."
  type = list(object({
    name        = string
    access_type = string
    metadata    = optional(map(string))
  }))
}

# Private Endpoints

variable "create_private_endpoints" {
  description = "Set to true to create private endpoints and Provide private_endpoints variable value, false to skip creation."
  type        = bool
  default     = true
}

# variable "private_endpoints" {
#   description = "Map of private endpoint configurations"
#   type = map(object({
#     name                                           = string
#     private_endpoint_custom_network_interface_name = optional(string)
#     private_endpoint_private_dns_zone_group = optional(object({
#       name                 = string
#       private_dns_zone_ids = list(string)
#     }))
#     private_endpoint_private_service_connection = object({
#       name                              = string
#       is_manual_connection              = bool
#       private_connection_resource_id    = optional(string)
#       private_connection_resource_alias = optional(string)
#       subresource_names                 = optional(list(string))
#       request_message                   = optional(string)
#     })
#     private_endpoint_ip_configuration = optional(object({
#       name               = string
#       private_ip_address = string
#       subresource_name   = optional(string)
#       member_name        = optional(string)
#     }))
#     private_endpoint_tags = optional(map(string))
#   }))
# }

