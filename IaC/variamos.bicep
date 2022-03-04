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

module variamosAppService 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosAppName
  params:{
    appName:variamosAppName
    location:location
    appKind: appKind
    aspId:variamosAsp.outputs.aspId
  }  
}

module variamosAsp 'variamosAsp.bicep' = {
  scope: resourceGroup(rg.name)
  name: aspName
  params:{
    appServicePlanName:aspName
    location: location
    aspKind: aspKind
  }
}
