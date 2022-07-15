param appName string 
param location string = resourceGroup().location
param appKind string
param appServicePlanName string
param dockerImage string = ''
param publishingUsername string = ''

resource webSites 'Microsoft.Web/sites@2021-03-01' = {
    name: appName
    location: location
    kind: appKind
    properties: {
        enabled: true
        hostNameSslStates: [
            {
                name: '${appName}.azurewebsites.net' 
                sslState: 'Disabled'
                hostType: 'Standard'
            }
            {
                name: '${appName}.scm.azurewebsites.net'
                sslState: 'Disabled'
                hostType: 'Repository'
            }
        ]
        serverFarmId: asp.id
        reserved: true
        isXenon: false
        hyperV: false
        siteConfig: {
            numberOfWorkers: 1
            linuxFxVersion: 'DOCKER|${dockerImage}'
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
        containerSize: 0
        dailyMemoryTimeQuota: 0
        httpsOnly: false
        redundancyMode: 'None'
        storageAccountRequired: false
        keyVaultReferenceIdentity: 'SystemAssigned'
    }
    
    resource ftp 'basicPublishingCredentialsPolicies' = {
        name: 'ftp' 
        location: location
        properties: {
            allow: true
        }
    }
    
    resource scm 'basicPublishingCredentialsPolicies@2021-03-01' = {
        name: 'scm'
        location: location
        properties: {
            allow: true
        }
    }
    
    
    resource web 'config' = {
        name: 'web'
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
            linuxFxVersion: 'DOCKER|${dockerImage}'
            requestTracingEnabled: false
            remoteDebuggingEnabled: false
            remoteDebuggingVersion: 'VS2019'
            httpLoggingEnabled: false
            acrUseManagedIdentityCreds: false
            logsDirectorySizeLimit: 35
            detailedErrorLoggingEnabled: false
            publishingUsername: publishingUsername
            scmType: 'GitHub'
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
    
}

resource asp 'Microsoft.Web/serverfarms@2021-03-01' existing = {
    name: appServicePlanName
}
