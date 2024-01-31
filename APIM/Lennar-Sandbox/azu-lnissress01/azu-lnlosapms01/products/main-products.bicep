var apimName = 'azu-lnlosapms01'

module StarterProduct '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/products.bicep' = {
  name: 'StarterProductDeploy'
  params: {
    approvalRequired: false
    state: 'published'
    subscriptionRequired: true
    terms: 'test'
    tags: {}
    apimName: apimName
    displayName: 'Starter'
    productDescription: 'Product for Starter'
    resourceName: 'Starter'
  }
}

// Same name Product is existing 
// module UnlimitedProduct '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/products.bicep' = {
//   name: 'UnlimitedProductDeploy'
//   params: {
//     approvalRequired: false
//     state: 'published'
//     subscriptionRequired: true
//     terms: 'test'
//     tags: {}
//     apimName: apimName
//     displayName: 'Starter'
//     productDescription: 'Product for Unlimited'
//     resourceName: 'Unlimited'
//   }
// }
