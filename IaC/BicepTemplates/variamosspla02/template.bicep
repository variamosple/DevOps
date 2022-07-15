param sites_VariaMos_name string = 'variamos-02'
param sites_variamos_ms_languages_name string = 'variamos-ms-languages-02'
param sites_variamos_ms_apireference_name string = 'variamos-ms-apireference-02'
param sites_variamos_ms_restrictions_name string = 'variamos-ms-restrictions-02'
param registries_variamos_name string = 'variamos'
param serverfarms_ASP_variamosspla_a699_name string = 'ASP-variamosspla-a699'
param containerGroups_variamosweb_name string = 'variamosweb'
param location string = resourceGroup().location
param prefix string = 'variamos02'

resource containerGroups_variamosweb_name_resource 'Microsoft.ContainerInstance/containerGroups@2021-10-01' = {
  name: containerGroups_variamosweb_name
  location: location
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: containerGroups_variamosweb_name
        properties: {
          image: 'jsoto25/variamos-web:latest'
          ports: [
            {
              protocol: 'TCP'
              port: 80
            }
          ]
          environmentVariables: []
          resources: {
            requests: {
              memoryInGB: '1.5'
              cpu: 1
            }
          }
        }
      }
    ]
    initContainers: []
    restartPolicy: 'Always'
    ipAddress: {
      ports: [
        {
          protocol: 'TCP'
          port: 80
        }
      ]
      ip: '20.85.136.212'
      type: 'Public'
      dnsNameLabel: containerGroups_variamosweb_name
      dnsNameLabelReusePolicy: 'Unsecure'
    }
    osType: 'Linux'
  }
}

resource registries_variamos_name_resource 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: registries_variamos_name
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
  properties: {
    adminUserEnabled: true
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

resource serverfarms_ASP_variamosspla_a699_name_resource 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: serverfarms_ASP_variamosspla_a699_name
  location: location
  sku: {
    name: 'B2'
    tier: 'Basic'
    size: 'B2'
    family: 'B'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

resource sites_VariaMos_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_VariaMos_name
  location: location
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'variamos.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        //name: 'variamos.scm.azurewebsites.net'
        //sslState: 'Disabled'
        //hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos:cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099'
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

resource sites_variamos_ms_apireference_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_apireference_name
  location: location
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_apireference_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        //name: '${sites_variamos_ms_apireference_name}.scm.azurewebsites.net'
        //sslState: 'Disabled'
        //hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/${sites_variamos_ms_apireference_name}:e4c266cdcf468b4e1e079459d8473c87698934a7'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
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

resource sites_variamos_ms_languages_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_languages_name
  location: location
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_languages_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        //name: '${sites_variamos_ms_languages_name}.scm.azurewebsites.net'
        //sslState: 'Disabled'
        //hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos_ms_languages:3af48ce6f66d9ed7321edfac5a99ebdf22284b3b'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
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

resource sites_variamos_ms_restrictions_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_restrictions_name
  location: location
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_restrictions_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        //name: '${sites_variamos_ms_restrictions_name}.scm.azurewebsites.net'
        //sslState: 'Disabled'
        //hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos_ms_restrictions:1bc696b3d3f302cb8c5f50b0456629664fba217c'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
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

resource sites_VariaMos_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'ftp'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_apireference_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'ftp'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_languages_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'ftp'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_restrictions_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'ftp'
  location: location
  properties: {
    allow: true
  }
}

resource sites_VariaMos_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'scm'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_apireference_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'scm'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_languages_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'scm'
  location: location
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_restrictions_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'scm'
  location: location
  properties: {
    allow: true
  }
}

resource sites_VariaMos_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'web'
  location: location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos:cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$VariaMos'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_apireference_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'web'
  location: location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos-ms-apireference:e4c266cdcf468b4e1e079459d8473c87698934a7'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-apireference'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_languages_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'web'
  location: location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos_ms_languages:3af48ce6f66d9ed7321edfac5a99ebdf22284b3b'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-languages'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_restrictions_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'web'
  location: location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos_ms_restrictions:1bc696b3d3f302cb8c5f50b0456629664fba217c'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-restrictions'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_VariaMos_name_0611efd5cc712c25da2c01eb36d2e144a73048ae1644265406542 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '0611efd5cc712c25da2c01eb36d2e144a73048ae1644265406542'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"0611efd5cc712c25da2c01eb36d2e144a73048ae","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-07T20:23:30.1835237Z'
    end_time: '2022-02-07T20:23:30.1835237Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_18b2650af3ecc4a25b8682af423d4208998a5a021626818534649 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '18b2650af3ecc4a25b8682af423d4208998a5a021626818534649'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"18b2650af3ecc4a25b8682af423d4208998a5a02","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-20T22:02:15.0894994Z'
    end_time: '2021-07-20T22:02:15.0894994Z'
    active: false
  }
}

resource sites_variamos_ms_restrictions_name_1bc696b3d3f302cb8c5f50b0456629664fba217c1632424996396 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: '1bc696b3d3f302cb8c5f50b0456629664fba217c1632424996396'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"1bc696b3d3f302cb8c5f50b0456629664fba217c","repoName":"mauroagudeloz/variamos_ms_restrictions","slotName":"production"}'
    start_time: '2021-09-23T19:23:16.7978256Z'
    end_time: '2021-09-23T19:23:16.7978256Z'
    active: true
  }
}

resource sites_variamos_ms_languages_name_2ef71f53ed9f4e8cb8cfc9e139da57975421ad851634335251398 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '2ef71f53ed9f4e8cb8cfc9e139da57975421ad851634335251398'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"2ef71f53ed9f4e8cb8cfc9e139da57975421ad85","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-10-15T22:00:52.0305684Z'
    end_time: '2021-10-15T22:00:52.0305684Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_3af48ce6f66d9ed7321edfac5a99ebdf22284b3b1644265142631 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '3af48ce6f66d9ed7321edfac5a99ebdf22284b3b1644265142631'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"3af48ce6f66d9ed7321edfac5a99ebdf22284b3b","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2022-02-07T20:19:03.1301167Z'
    end_time: '2022-02-07T20:19:03.1301167Z'
    active: true
  }
}

resource sites_variamos_ms_languages_name_6774aa1bb7348165e8174c1f43795d3560d30c3a1626663689503 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '6774aa1bb7348165e8174c1f43795d3560d30c3a1626663689503'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"6774aa1bb7348165e8174c1f43795d3560d30c3a","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-19T03:01:29.8804687Z'
    end_time: '2021-07-19T03:01:29.8804687Z'
    active: false
  }
}

resource sites_VariaMos_name_7076e4a324fa1f9078b7968df8e50b42a3b811111643382101920 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7076e4a324fa1f9078b7968df8e50b42a3b811111643382101920'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7076e4a324fa1f9078b7968df8e50b42a3b81111","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T15:01:42.3682819Z'
    end_time: '2022-01-28T15:01:42.3682819Z'
    active: false
  }
}

resource sites_VariaMos_name_7265024aa62627a72e14063643cb45a8eedf22d71639267586698 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7265024aa62627a72e14063643cb45a8eedf22d71639267586698'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7265024aa62627a72e14063643cb45a8eedf22d7","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2021-12-12T00:06:27.1253791Z'
    end_time: '2021-12-12T00:06:27.1253791Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_73c6de7017b0cd67d7ce16b3638050bf604530461634397209790 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '73c6de7017b0cd67d7ce16b3638050bf604530461634397209790'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"73c6de7017b0cd67d7ce16b3638050bf60453046","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-10-16T15:13:30.1570911Z'
    end_time: '2021-10-16T15:13:30.1570911Z'
    active: false
  }
}

resource sites_VariaMos_name_7504222392d73b683fb138a49dcfb13a70993eb91643376285081 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7504222392d73b683fb138a49dcfb13a70993eb91643376285081'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7504222392d73b683fb138a49dcfb13a70993eb9","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:24:45.4233965Z'
    end_time: '2022-01-28T13:24:45.4233965Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_7a536898bfed6ecc30ff846bda330375e1232be61624416510335 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '7a536898bfed6ecc30ff846bda330375e1232be61624416510335'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7a536898bfed6ecc30ff846bda330375e1232be6","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-23T02:48:31.7456767Z'
    end_time: '2021-06-23T02:48:31.7456767Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_8688e0b9fc78adcaa6e122c12dbb08f36ac9caef1624417099517 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '8688e0b9fc78adcaa6e122c12dbb08f36ac9caef1624417099517'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"8688e0b9fc78adcaa6e122c12dbb08f36ac9caef","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-23T02:58:19.9082338Z'
    end_time: '2021-06-23T02:58:19.9082338Z'
    active: false
  }
}

resource sites_VariaMos_name_9f3dbec998bf3989c19a62c37375e48f519e349f1643377791282 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '9f3dbec998bf3989c19a62c37375e48f519e349f1643377791282'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"9f3dbec998bf3989c19a62c37375e48f519e349f","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:49:51.7416177Z'
    end_time: '2022-01-28T13:49:51.7416177Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_a0d3252e3f988475d79eb930dd02d0b8907165811625713114970 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'a0d3252e3f988475d79eb930dd02d0b8907165811625713114970'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a0d3252e3f988475d79eb930dd02d0b890716581","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-08T02:58:35.3464792Z'
    end_time: '2021-07-08T02:58:35.3464792Z'
    active: false
  }
}

resource sites_VariaMos_name_a308c60a8d57ed82ed80992815c9670a5420a43b1643840578680 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'a308c60a8d57ed82ed80992815c9670a5420a43b1643840578680'
  location: location
  properties: {
    status: 4
    author: 'aolopezeafit'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a308c60a8d57ed82ed80992815c9670a5420a43b","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-02T22:22:59.1414649Z'
    end_time: '2022-02-02T22:22:59.1414649Z'
    active: false
  }
}

resource sites_VariaMos_name_a9070739c32d2cba30c427aec41cf2f9aba8b8791645667931729 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'a9070739c32d2cba30c427aec41cf2f9aba8b8791645667931729'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a9070739c32d2cba30c427aec41cf2f9aba8b879","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-24T01:58:52.1279235Z'
    end_time: '2022-02-24T01:58:52.1279235Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_bfb639849165e929fcb1316dcdcd31490e65bd901626823819261 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'bfb639849165e929fcb1316dcdcd31490e65bd901626823819261'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"bfb639849165e929fcb1316dcdcd31490e65bd90","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-20T23:30:19.6609299Z'
    end_time: '2021-07-20T23:30:19.6609299Z'
    active: false
  }
}

resource sites_VariaMos_name_c5a78959642adfcbfff16f0a7ca531a445e3879d1644265234708 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'c5a78959642adfcbfff16f0a7ca531a445e3879d1644265234708'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"c5a78959642adfcbfff16f0a7ca531a445e3879d","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-07T20:20:37.895624Z'
    end_time: '2022-02-07T20:20:37.895624Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_caa543bdae65d5922cbd4c09769a22a4d32ef3b51624753771703 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'caa543bdae65d5922cbd4c09769a22a4d32ef3b51624753771703'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"caa543bdae65d5922cbd4c09769a22a4d32ef3b5","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-27T00:29:32.4336149Z'
    end_time: '2021-06-27T00:29:32.4336149Z'
    active: false
  }
}

resource sites_VariaMos_name_cfcf8c8fc870713e2faffc8ce3e925d0f0ffe0991646416549466 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'cfcf8c8fc870713e2faffc8ce3e925d0f0ffe0991646416549466'
  location: location
  properties: {
    status: 4
    author: 'aolopezeafit'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-03-04T17:55:49.7892272Z'
    end_time: '2022-03-04T17:55:49.7892272Z'
    active: true
  }
}

resource sites_variamos_ms_apireference_name_e4c266cdcf468b4e1e079459d8473c87698934a71644269255706 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'e4c266cdcf468b4e1e079459d8473c87698934a71644269255706'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"e4c266cdcf468b4e1e079459d8473c87698934a7","repoName":"mauroagudeloz/variamos-ms-apireference","slotName":"production"}'
    start_time: '2022-02-07T21:27:36.1450757Z'
    end_time: '2022-02-07T21:27:36.1450757Z'
    active: true
  }
}

resource sites_variamos_ms_apireference_name_f5e41694ba81ce5e0551989241b968389c556b3e1644268583702 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'f5e41694ba81ce5e0551989241b968389c556b3e1644268583702'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"f5e41694ba81ce5e0551989241b968389c556b3e","repoName":"mauroagudeloz/variamos-ms-apireference","slotName":"production"}'
    start_time: '2022-02-07T21:16:24.1148182Z'
    end_time: '2022-02-07T21:16:24.1148182Z'
    active: false
  }
}

resource sites_VariaMos_name_ffa0f8b7007d60880c28340171877696d61348ca1643376469308 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'ffa0f8b7007d60880c28340171877696d61348ca1643376469308'
  location: location
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"ffa0f8b7007d60880c28340171877696d61348ca","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:27:50.1318451Z'
    end_time: '2022-01-28T13:27:50.1318451Z'
    active: false
  }
}

resource sites_VariaMos_name_sites_VariaMos_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '${sites_VariaMos_name}.azurewebsites.net'
  location: location
  properties: {
    siteName: 'VariaMos'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_apireference_name_sites_variamos_ms_apireference_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: '${sites_variamos_ms_apireference_name}.azurewebsites.net'
  location: location
  properties: {
    siteName: 'variamos-ms-apireference'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_languages_name_sites_variamos_ms_languages_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '${sites_variamos_ms_languages_name}.azurewebsites.net'
  location: location
  properties: {
    siteName: 'variamos-ms-languages'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_restrictions_name_sites_variamos_ms_restrictions_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: '${sites_variamos_ms_restrictions_name}.azurewebsites.net'
  location: location
  properties: {
    siteName: 'variamos-ms-restrictions'
    hostNameType: 'Verified'
  }
}
