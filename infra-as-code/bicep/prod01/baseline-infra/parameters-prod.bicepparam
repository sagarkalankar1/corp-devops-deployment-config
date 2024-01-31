using '../../main.bicep'

/* 
This Bicep template is used to deploy a sample Storage Account resource along with all the required resources.
The resources that are being deployed are:
  - Storage Account (Private Endpoint)
*/

param env = 'prod'
param sharedVnetName = 'az-lnip-lenos01-vnet'
param sharedResourceGroupName = 'sharedservices'
param privEndpointSubnetName = 'AzureDevOpsDBTVMSS'
param privDnsSubscriptionId = '51ecb75c-f35f-43d1-9e7e-e12602374f08'
param privDnsSharedResourceGroup = 'sharedservices'
param storageSkuName = 'Standard_LRS'
param publicNetworkAccess = 'Disabled'
param kind = 'StorageV2'

param tags = {
  CreatedVia: 'Bicep'
  Purpose: 'StorageAccount to store tfstate files and custom scripts'
  ApplicationName: 'Azure Devops'
  ApplicationOwner: 'Amado Sierra'
  CostCenter: '90001410'
  Environment: 'Production'
}
