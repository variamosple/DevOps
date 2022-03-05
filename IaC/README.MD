# variamosAsp.bicep

![Variamos Deployment Diagram](DeplymentDiagram.jpg "Variamos Deployment Diagram")

## Prerequisites

- Azure Subscription
- New Resource Group

## Deploy variamos to Azure

To deploy variamosApp execute from PowerShell the Next command:

    .\variamos.ps1 -deploymentName 'VariamosDeploy' -location 'westus' -templateFile 'variamos.bicep' -variamosAppName 'variamosapp' -appKind 'app,linux,container' -aspName 'variamosasp' -subscriptionName 'BizSpark-Applipets' -resourceGroupName 'rglabvariamos5000' -aspKind 'linux'
