
param apimName string = 'azu-lnlosapms01'

var subscriptionsMap = [
  {
    name: 'sample-subscription-1'
    displayName: 'sample-subscription-1'
    scope: '</products/{productId}>'
    allowTracing: true
    ownerId: '</users/{userId}>'
    primaryKey: ''
    secondaryKey: ''
    state: 'active'
  }
  { 
    name: 'sample-subscription-2'
    displayName: 'sample-subscription-2'
    scope: '</products/{productId}>'
    allowTracing: false
    ownerId: '</users/{userId}>'
    primaryKey: ''
    secondaryKey: ''
    state: 'submitted'
  }
]

module apimSubscriptions '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/subscriptions.bicep' = [for subscriptions in subscriptionsMap: {
  name: '${subscriptions.name}subscriptionsDeploy'
  params: {
    apimName: apimName
    displayName: subscriptions.displayName
    scope: subscriptions.scope
    allowTracing: subscriptions.allowTracing
    ownerId: subscriptions.ownerId
    primaryKey: subscriptions.primaryKey
    secondaryKey: subscriptions.secondaryKey
    state: subscriptions.state
  }
}]
