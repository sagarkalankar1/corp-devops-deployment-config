//This code is to deploy SA in dev

using '../../main3.bicep'


param sharedVnetName = 'az-lnid-lenos01-vnet'    //'azsand-lndevops-rbace-d01-vnet'
param sharedResourceGroupName = 'sharedservices'    //'sharedservices-sandbox'
param privEndpointSubnetName = 'AzureDevOpsVMSS'    //'azsand-lnid-aca-sn'    //'azsand-lnis-aca-sn'
param privDnsSubscriptionId = 'ac617daa-1bcf-4152-bb1c-ca3ac1165196'   //'1971f0d2-b061-4971-bbee-56171d168156'     
param privDnsSharedResourceGroup = 'sharedservices'   //'sharedservices-sandbox'

param storageSkuName = 'Premium_LRS'   //'Standard_LRS'
param publicNetworkAccess = 'Disabled'
param kind = 'FileStorage'    //'StorageV2'
