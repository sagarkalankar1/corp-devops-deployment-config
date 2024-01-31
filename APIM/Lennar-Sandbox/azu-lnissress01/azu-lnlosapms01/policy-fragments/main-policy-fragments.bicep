/* 
Due to limitation of bicep which requires file path to be static (var) instead of dynamic (param),
we are forced to add a resource block per Policy Fragment instead of single resource block 
with iteration which could have been in the CD template.
*/

var apimName = 'azu-lnissress01'

var policyFragment1 = {
  name: 'fragment1'
  path: 'policies/fragment-1.xml'
  format: 'xml'
  description: 'Sample Policy fragment'
 }

var policyFragment2 = {
  name: 'fragment2'
  path: 'policies/fragment-2.xml'
  format: 'xml'
  description: 'Sample Policy fragment'
 }

resource apim 'Microsoft.ApiManagement/service@2023-03-01-preview' existing = {
  name: apimName
}

resource fragmentPolicy 'Microsoft.ApiManagement/service/policyFragments@2023-03-01-preview' = {
  name: policyFragment1.name
  parent: apim
  properties: {
    format: policyFragment1.format
    description: policyFragment1.description
    value: loadTextContent(policyFragment1.path)
  }
}

resource fragmentPolicy2 'Microsoft.ApiManagement/service/policyFragments@2023-03-01-preview' = {
  name: policyFragment2.name
  parent: apim
  properties: {
    format: policyFragment2.format
    description: policyFragment2.description
    value: loadTextContent(policyFragment2.path)
  }
}
