targetScope = 'subscription'
param resourceGroupName string = ''
param variamosAppName string = ''
param variamosAppDockerImage string = 'index.docker.io/magudeloz/variamos:cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099'
param variamosAppPublishingUsername string = 'mauroagudeloz'
param variamosApiName string = ''
param variamosApiDockerImage string = 'variamos.azurecr.io/variamos/variamos-ms-apireference:e4c266cdcf468b4e1e079459d8473c87698934a7'
param variamosApiPublishingUsername string = 'mauroagudeloz'
param variamosAppLanguajeName string = ''
param variamosAppLanguajeDockerImage string = 'index.docker.io/magudeloz/variamos_ms_languages:3af48ce6f66d9ed7321edfac5a99ebdf22284b3b'
param variamosAppLanguajePublishingUsername string = 'mauroagudeloz'
param variamosAppRestrictionsName string = ''
param variamosAppRestrictionsDockerImage string = 'variamos.azurecr.io/variamos/variamos_ms_restrictions:1bc696b3d3f302cb8c5f50b0456629664fba217c'
param variamosAppRestrictionsPublishingUsername string = 'mauroagudeloz'
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
/*
module variamosAppService 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosAppName
  dependsOn:[
    variamosAsp
  ]
  params:{
    appName: variamosAppName
    location: location
    appKind: appKind
    aspId: variamosAsp.outputs.aspId
    dockerImage: variamosAppDockerImage
    publishingUsername: variamosAppPublishingUsername
  }  
}
*/

module variamosApiService 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosApiName
  dependsOn:[
    variamosAsp
  ]
  params:{
    appName: variamosApiName
    location: location
    appKind: appKind
    aspId: variamosAsp.outputs.aspId
    dockerImage: variamosApiDockerImage
    publishingUsername: variamosApiPublishingUsername
  }  
}

module variamosAppLanguaje 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosAppLanguajeName
  dependsOn:[
    variamosAsp
  ]
  params:{
    appName: variamosAppLanguajeName
    location: location
    appKind: appKind
    aspId: variamosAsp.outputs.aspId
    dockerImage: variamosAppLanguajeDockerImage
    publishingUsername: variamosAppLanguajePublishingUsername
  }  
}

module variamosAppRestrictions 'variamosApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: variamosAppRestrictionsName
  dependsOn:[
    variamosAsp
  ]
  params:{
    appName: variamosAppRestrictionsName
    location: location
    appKind: appKind
    aspId: variamosAsp.outputs.aspId
    dockerImage: variamosAppRestrictionsDockerImage
    publishingUsername: variamosAppRestrictionsPublishingUsername
  }  
}


