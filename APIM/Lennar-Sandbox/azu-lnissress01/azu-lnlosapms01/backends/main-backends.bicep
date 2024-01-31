// craeat map of backends for iteration based deployment.

param apimName string = 'azu-lnlosapms01'

var backendsMap = [
  {
    name: 'gfx-bff-sb'
    url:  'https://lnos-gfx-app-bff-sb.azurewebsites.net' //incorrect
    description: 'Backend for App service BFF of GFX'
    targetAppResourceGroup: 'azu-lngfxress01'
    webAppName: 'lnos-gfx-app-bff-sb'
    linkToWebApp: true
    protocol: 'http'
  }
  { 
    name: 'gfx-pdf-sb'
    url:  'https://lnos-gfx-app-pdf-sb.azurewebsites.net' //incorrect
    description: 'Backend for App service PDF of GFX Sandbox Environment'
    webAppName: 'lnos-gfx-app-pdf-sb'
    targetAppResourceGroup: 'azu-lngfxress01'
    linkToWebApp: true
    protocol: 'http'
  }
]


module apimBackends '../../../../../../iac-modules/Infra-As-Code/Modules/Bicep/ApiManagement/service/backends.bicep' = [for backend in backendsMap: {
  name: '${backend.name}BackendDeploy'
  params: {
    apimName: apimName
    backendDescription: backend.description
    protocol: backend.protocol
    url: backend.url
    webAppName: backend.webAppName
    linkToWebApp: backend.linkToWebApp
    resourceName: backend.name
    targetAppResourceGroup: backend.targetAppResourceGroup
  }
}]
