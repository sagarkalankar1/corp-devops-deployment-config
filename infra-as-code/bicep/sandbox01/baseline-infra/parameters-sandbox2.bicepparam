//Below code is to deploy storage account in sandbox

using '../../main2.bicep'


param sharedVnetName = 'azsand-lndevops-rbace-d01-vnet'
param sharedResourceGroupName = 'sharedservices-sandbox'      //'sharedservices'(dev, prod)    
param privEndpointSubnetName = 'azsand-lnis-aca-sn'      //'azsand-lnid-aca-sn'    //'azsand-lnis-aca-sn'
param privDnsSubscriptionId = '1971f0d2-b061-4971-bbee-56171d168156'      //'ac617daa-1bcf-4152-bb1c-ca3ac1165196'(dev,prod)
param privDnsSharedResourceGroup = 'sharedservices-sandbox'     //'sharedservices'(dev, prod)   

param storageSkuName = 'Premium_LRS'   //'Standard_LRS'
param publicNetworkAccess = 'Disabled'
param kind = 'FileStorage'    //'StorageV2'
