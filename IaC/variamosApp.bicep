//Microsoft.Web/sites

param appName string = 'variamosapp'
param location string = resourceGroup().location
param appKind string = 'app,linux,container'
param aspName string =  'variamosasp'

module asp 'appServicePlan.bicep' = {
  name: aspName
  params:{
    appServicePlanName:aspName
    location: location
  }
}


resource variamosApp 'Microsoft.Web/sites@2021-03-01' = {
  name: appName
  location: location
  kind: appKind
  properties: {
    enabled: true
    hostNameSslStates: [
        {
            name: 'variamos.azurewebsites.net'
            sslState: 'Disabled'
            hostType: 'Standard'
        }
        {
            name: 'variamos.scm.azurewebsites.net'
            sslState: 'Disabled'
            hostType: 'Repository'
        }
    ]
    serverFarmId: asp.outputs.aspId
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
        numberOfWorkers: 1
        linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos:a9070739c32d2cba30c427aec41cf2f9aba8b879'
        acrUseManagedIdentityCreds: false
        alwaysOn: false
        http20Enabled: false
        functionAppScaleLimit: 0
        minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
}
} 
