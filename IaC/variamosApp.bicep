//Microsoft.Web/sites

param appName string = 'variamosapp'
param location string = ''
param appKind string = 'applinuxcontainer'
param aspId string = ''
param dockerImage string = ''
param publishingUsername string = ''
// For variamos the value is: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
//param customDomainVerificationId string = ''

//param aspName string =  'variamosasp'

resource variamosApp 'Microsoft.Web/sites@2021-03-01' = {
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
        serverFarmId: aspId
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
        //customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
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
