param(
    $deploymentName = 'VariamosAppDeploy',
    $templateFile = 'variamosApp.bicep',
    $appName = 'variamosapp',
    $ppKind = 'app,linux,container',
    $aspName = 'variamosasp',
    $subscriptionName = 'BizSpark-Applipets',
    $resourceGroupName = 'rglabvariamos3000'
)

Connect-AzAccount

$context = Get-AzSubscription -SubscriptionName $subscriptionName
Set-AzContext $context


Set-AzDefault -ResourceGroupName $resourceGroupName

New-AzResourceGroupDeployment -Name $deploymentName -TemplateFile $templateFile -appName $appName -appKind $ppKind -aspName $aspName