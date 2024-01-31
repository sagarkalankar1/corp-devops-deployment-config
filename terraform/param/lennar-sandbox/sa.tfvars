# local 
naming_convention_properties = {
  subscription_name = "lnos"
  project_code      = "ado"
  environment       = "dev"
}

# Main Resource Group name in which Storage Account resource deployed
# Resoure Group Data Block
main_resource_group_name = "azu-lnadoresd01"

# Main Subnet 
# Subnet Data Block 
# main_subnet_name                 = "azsand-lnis-privend-sn"
# main_subnet_virtual_network_name = "azsand-lndevops-rbace-d01-vnet"
# main_subnet_resource_group_name  = "SharedServices-SandBox"

# Storage Account
storage_account_resource_name                 = "sa"
storage_account_account_tier                  = "Standard"
storage_account_account_replication_type      = "LRS"
storage_account_public_network_access_enabled = true
storage_account_account_kind                  = "StorageV2"

storage_account_identity = {
  type = "SystemAssigned"
}

containers = [
  {
    name        = "vmss-container"
    access_type = "container"
  }
]

create_private_endpoints = false
# private_endpoints = {
#   private_endpoint_blob = {
#     name = "blob-private_endpoint"
#     private_endpoint_private_service_connection = {
#       name                 = "sa-storage-connection-blob"
#       is_manual_connection = false
#       subresource_names    = ["blob"]
#     }
#   }
#   private_endpoint_table = {
#     name = "table-private_endpoint"
#     private_endpoint_private_service_connection = {
#       name                 = "sa-storage-connection-table"
#       is_manual_connection = false
#       subresource_names    = ["table"]
#     }
#   }
#   private_endpoint_queue = {
#     name = "queue-private_endpoint"
#     private_endpoint_private_service_connection = {
#       name                 = "sa-storage-connection-queue"
#       is_manual_connection = false
#       subresource_names    = ["queue"]
#     }
#   }
#   private_endpoint_file = {
#     name = "file-private_endpoint"
#     private_endpoint_private_service_connection = {
#       name                 = "sa-storage-connection-file"
#       is_manual_connection = false
#       subresource_names    = ["file"]
#     }
#   }
# }
