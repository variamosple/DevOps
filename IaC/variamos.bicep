targetScope = 'subscription'
param resourceGroupName string = ''
param variamosAppName string = ''
param location string = deployment().location
param appKind string = 'app,linux,container'
param aspName string =  'variamosasp'
param aspKind string = 'linux'

module rg 'variamosResourceGroup.bicep' = {
  name:resourceGroupName
  params:{
    location:location
    resourceGroupName:resourceGroupName
  }
}

module variamosAsp 'variamosAsp.bicep' = {
  scope: resourceGroup(rg.name)
  name: aspName
  dependsOn:[
    rg
  ]
  params:{
    appServicePlanName:aspName
    location: location
    aspKind: aspKind
  }
}

module variamosAppService 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosAppName
  dependsOn: [
    variamosAsp
    rg
  ]
  params:{
    appName: variamosAppName
    location: location
    appKind: appKind
    aspId: variamosAsp.outputs.aspId
  }  
}


