
param env string
param location string = resourceGroup().location
param sharedVnetName string
param sharedResourceGroupName string
param privEndpointSubnetName string
param privDnsSubscriptionId string
param privDnsSharedResourceGroup string

param storageSkuName string
param publicNetworkAccess string
param kind string

param tags object
/*
param tags object = {
  CreatedVia: 'Bicep'
  Purpose: 'StorageAccount to store tfstate files'
  ApplicationName: 'Azure Devops'
  ApplicationOwner: 'Amado Sierra'
  CostCenter: '90001410'
  Environment: 'Sandbox'
}
*/

param namingConventionProperties object = {
  subscriptionName: 'lnos'
  projectCode: 'ado'
  environment: '${env}'
}

module StorageAccount '../../../iac-modules/Infra-As-Code/Modules/Bicep/Storage/storageAccount.bicep' = {
  name: 'StorageAccountDeploy'
  params: {
    kind: kind
    location: location
    publicNetworkAccess: publicNetworkAccess
    saMetadata: {
      pvtDnsZone: {
        resourceGroupName: privDnsSharedResourceGroup
        subscriptionId: privDnsSubscriptionId
      }
      sharedResourceGroup: sharedResourceGroupName
      blobPrivEndpointSubnetName: privEndpointSubnetName
      tablePrivEndpointSubnetName: privEndpointSubnetName
      queuePrivEndpointSubnetName: privEndpointSubnetName
      filePrivEndpointSubnetName: privEndpointSubnetName
      sharedVnetName: sharedVnetName
    }
    storageSkuName: storageSkuName 
    tags: tags
    namingConventionProperties: namingConventionProperties
    shortName:'devops1'
  }
}

module Blob '../../../iac-modules/Infra-As-Code/Modules/Bicep/Storage/StorageAccounts/blobServices.bicep' = {
  name: 'blob'
  params: {
    storageAccountName: StorageAccount.outputs.storage.name
  }
}

module ContainerStateFile '../../../iac-modules/Infra-As-Code/Modules/Bicep/Storage/StorageAccounts/BlobServices/container.bicep' = {
  name: 'containerStateFile'
  params: {
    resourceName: 'statefiles'
    storageAccountName: StorageAccount.outputs.storage.name
  }
}

module ContainerCustomScript '../../../iac-modules/Infra-As-Code/Modules/Bicep/Storage/StorageAccounts/BlobServices/container.bicep' = {
  name: 'containerCustomScript'
  params: {
    resourceName: 'customscript'
    storageAccountName: StorageAccount.outputs.storage.name
  }
}
