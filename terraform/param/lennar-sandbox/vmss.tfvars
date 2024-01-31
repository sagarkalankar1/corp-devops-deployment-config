# local 
naming_convention_properties = {
  subscription_name = "lnsb"
  project_code      = "poc"
  environment       = "sb"
}

# Main Resource Group name in which VMSS resource deployed
# Resoure Group Data Block
main_resource_group_name = "azu-lndevopsd01"

# Main Subnet which is refered in VMSS Network Interface
# Subnet Data Block 
main_subnet_name                 = "azsand-lnis-privend-sn"
main_subnet_virtual_network_name = "azsand-lndevops-rbace-d01-vnet"
main_subnet_resource_group_name  = "SharedServices-SandBox"

# Virtual Machine name
ref_virtual_machine_name = "lnsb-poc-sb-ado-ref-vm"

# Virtual Machine Scale Set
vm_image_name                   = "vmimg"
virtual_machine_scale_set_name  = "vmss"
os_flavor                       = "linux"
vm_sku                          = "Standard_F2"
admin_username                  = "adminuser"
instance_count                  = 1
disable_password_authentication = false

vmss_network_interface_name                          = "vmss-nic"
vmss_network_interface_ip_configuration_name         = "internal"
vmss_network_interface_dns_servers                   = []
vmss_network_interface_enable_ip_forwarding          = false
vmss_network_interface_enable_accelerated_networking = true

os_disk_storage_account_type = "StandardSSD_ZRS"
os_disk_caching              = "ReadWrite"

identity_type = "SystemAssigned"

boot_diagnostics_storage_account_uri = null

secure_boot_enabled                               = false
vtpm_enabled                                      = false
do_not_run_extensions_on_overprovisioned_machines = false