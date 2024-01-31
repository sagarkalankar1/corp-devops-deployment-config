# local 
naming_convention_properties = {
  subscription_name = "lnosd"
  project_code      = "dbt"
  environment       = "dev"
}

# Main Resource Group name in which VMSS resource deployed
# Resoure Group Data Block
main_resource_group_name = "azu-lnadoresd01"    

# Main Subnet which is refered in VMSS Network Interface
# Subnet Data Block 
main_subnet_name                 = "AzureDevOpsVMSS"
main_subnet_virtual_network_name = "az-lnid-lenos01-vnet"
main_subnet_resource_group_name  = "sharedservices"

# Virtual Machine name
main_virtual_machine_image_name = ""
resource_group_name             = ""
main_virtual_machine_image_id   = "/subscriptions/bab871b9-ac22-460b-919a-d51ea040aef3/resourceGroups/azu-lnadoresd01/providers/Microsoft.Compute/galleries/dvtstdevopsimages/images/dvopsubu2204/versions/1.0.0"

# Virtual Machine Scale Set
virtual_machine_scale_set_name  = "vmss"
os_flavor                       = "linux"
vm_sku                          = "Standard_F2s_v2"
admin_username                  = "adminuser"
instance_count                  = 1
disable_password_authentication = false

vmss_network_interface_name                          = "vmss-nic"
vmss_network_interface_ip_configuration_name         = "internal"
vmss_network_interface_dns_servers                   = []
vmss_network_interface_enable_ip_forwarding          = false
vmss_network_interface_enable_accelerated_networking = true

os_disk_storage_account_type = "Premium_LRS"
# os_disk_storage_account_type = "StandardSSD_LRS"
os_disk_caching              = "ReadWrite"

identity_type = "SystemAssigned"

boot_diagnostics_storage_account_uri = null

secure_boot_enabled                               = true
vtpm_enabled                                      = true
do_not_run_extensions_on_overprovisioned_machines = false