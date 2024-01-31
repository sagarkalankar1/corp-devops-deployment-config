using '../../main1.bicep'

param env = 'sb'
param sharedVnetName = 'azsand-lndevops-rbace-d01-vnet'
param sharedResourceGroupName = 'sharedservices-sandbox'
param privEndpointSubnetName = 'azsand-lnis-aca-sn'
param privDnsSubscriptionId = '1971f0d2-b061-4971-bbee-56171d168156'    //'ac617daa-1bcf-4152-bb1c-ca3ac1165196'
param privDnsSharedResourceGroup = 'sharedservices-sandbox'

param storageSkuName = 'Standard_LRS'  //'Premium_LRS'   
param publicNetworkAccess = 'Disabled'
param kind = 'StorageV2'    //'FileStorage'  

param tags = {
  CreatedVia: 'Bicep'
  Purpose: 'StorageAccount to store tfstate files'
  ApplicationName: 'Azure Devops'
  ApplicationOwner: 'Amado Sierra'
  CostCenter: '90001410'
  Environment: 'Sandbox'
}


