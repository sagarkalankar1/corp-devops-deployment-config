using '../../main.bicep'
// All the parameters which are declared in main.bicep files which are not set as default need to be passeed here or overidden at pipeline level.


param env = 'uat'

param envVersion = '01'

//============== CHanged For PROD ==========================
param storageSkuName = <storageSkuName> //Deploy Note: Prefer to ZRS/GRS for Prod Env
//============== CHanged For PROD ==========================

// NOTE: If Stack configuration is not reflecting in App Service, use:
// 'az webapp list-runtimes --linux'  command to find latest value, 
// *The values retured are in 'Node:18-lts' format, replace the ':' with a '|' to get bicep format, ie: 'Node|18-lts'*


param appServicePlanLinuxSku = <appServicePlanLinuxSku>

param appServicePlanLogicSku = <appServicePlanLogicSku>

param staticWebAppSku = <staticWebAppSku>

param logAnalyticsWorkspaceSku = <logAnalyticsWorkspaceSku>
