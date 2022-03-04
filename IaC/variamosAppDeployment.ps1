param(
    $deploymentName = 'VariamosAppDeploy',
    $templateFile = 'variamosApp.bicep',
    $appName = 'variamosapp',
    $ppKind = 'app,linux,container',
    $aspName = 'variamosasp',
    $subscriptionName = '',
    $resourceGroupName = 'rglabvariamos3000',
    $location = 'westus'
)

Connect-AzAccount

$context = Get-AzSubscription -SubscriptionName $subscriptionName
Set-AzContext $context

# Deploy the resource group
New-AzSubscriptionDeployment -TemplateFile variamosResourceGroup.bicep -Name $deploymentName -Location $location -resourceGroupName $resourceGroupName

Set-AzDefault -ResourceGroupName $resourceGroupName

# Deploy the AppServicePlan and the App Service 
New-AzResourceGroupDeployment -Name $deploymentName -TemplateFile $templateFile -appName $appName -appKind $ppKind -aspName $aspName 