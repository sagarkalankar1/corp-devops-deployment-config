# local 
naming_convention_properties = {
  subscription_name = "lnsb"
  project_code      = "poc"
  environment       = "sb"
}                               

# Main Resource Group name in which VM resource deployed
# Resoure Group Data Block Variables
main_resource_group_name = "azu-lndevopsd01"

# Subnet which is refered in VM Network Interface
# Subnet Data Block Variables
subnet_name                 = "azsand-lnis-privend-sn"
virtual_network_name        = "azsand-lndevops-rbace-d01-vnet"
subnet_resource_group_name  = "SharedServices-SandBox"

# Variables for VM Module
virtual_machine_name                = "ado-ref-vm" 
virtual_machine_image_os            = "linux"
virtual_machine_location            = "eastus"
virtual_machine_resource_group_name = "azu-lndevopsd01"
virtual_machine_size                = "Standard_F2"
zone                                = 1

# OS Disk Configuration
virtual_machine_os_disk = {
  name                 = "os-disk"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
}

# Source Image Reference
source_image_reference = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts"
  version   = "latest"
}

# Authentication Configuration
virtual_machine_admin_username      = "adminroot"

# New Network Interface Configuration
new_network_interface = {
  name = "ado-ref-nic"

  ip_configurations = [
    {
      name                          = "internal"
      private_ip_address_allocation = "Dynamic"
    }
  ]
}

# Tags for the Virtual Machine
tags = {
  createFor = "Packer POC"
  date      = 20231117
}
