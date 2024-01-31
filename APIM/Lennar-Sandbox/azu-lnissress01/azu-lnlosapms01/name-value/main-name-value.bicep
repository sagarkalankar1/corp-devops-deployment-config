param apimName string = 'azu-lnlosapms01'

var plaintextNamedValuesMap = [
  {
    name: 'sample-name-value-1'
    displayName: 'sample-1'
    value: 'update-me'
    tags: {}
  }
  { 
    name: 'sample-name-value-2'
    displayName: 'sample-2'
    value: 'update-me'
    tags: {}
  }
]

var kvBasedNamedValuesMap = [
  {
    name: 'kv-name-value-1'
    displayName: 'kv-sample-1'
    secretIdentifier: '<ID OF SECERET>'
    identityClientId: '<null for systemassigned>'
    tags: {}
  }
  { 
    name: 'kv-name-value-2'
    displayName: 'kv-sample-2'
    secretIdentifier: '<ID OF SECERET>'
    identityClientId: '<null for systemassigned>'
    tags: {}
  }
]


module apimPlainTextNameValue '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/plaintextNamedValues.bicep' = [for nameValue in plaintextNamedValuesMap: {
  name: '${nameValue.name}plainTextNameValueDeploy'
  params: {
    apimName: apimName
    displayName: nameValue.displayName
    value: nameValue.value
    tags: nameValue.tags
  }
}]


module apimKvBasedNamedValuesMap '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/keyvaultBasedSecretNamedValues.bicep' = [for kvNameValue in kvBasedNamedValuesMap: {
  name: '${kvNameValue.name}KvNameValueDeploy'
  params: {
    apimName: apimName
    displayName: kvNameValue.displayName
    secretIdentifier: kvNameValue.secretIdentifier
    identityClientId: kvNameValue.identityClientId
    tags: kvNameValue.tags
  }
}]
