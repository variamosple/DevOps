# variamosAsp.bicep

![Variamos Deployment Diagram](DeplymentDiagram.jpg "Variamos Deployment Diagram")

## Prerequisites

- Azure Subscription
- New Resource Group

## Deploy variamos to Azure

To deploy variamosApp execute from PowerShell the Next command:

    .\variamos.ps1 -deploymentName 'VariamosAppDeploy' -location 'westus' -templateFile 'variamos.bicep' -variamosAppName 'variamosapp' -appKind 'app,linux,container' -aspName 'variamosasp' -subscriptionName 'BizSpark-Applipets' -resourceGroupName 'rglabvariamos3000' -aspKind 'linux'
