param(
    $deploymentName = 'VariamosAppDeploy',
    $location = 'westus',
    $templateFile = 'variamos.bicep',
    $variamosAppName = 'variamosapp',
    $appKind = 'app,linux,container',
    $aspName = 'variamosasp',
    $subscriptionName = 'BizSpark-Applipets',
    $resourceGroupName = 'rglabvariamos3000',
    $aspKind = 'linux'
)

Connect-AzAccount

$context = Get-AzSubscription -SubscriptionName $subscriptionName
Set-AzContext $context

New-AzSubscriptionDeployment -TemplateFile $templateFile -Name $deploymentName -Location $location -variamosAppName $variamosAppName -appKind $appKind -aspName $aspName -resourceGroupName $resourceGroupName -aspKind $aspKind
