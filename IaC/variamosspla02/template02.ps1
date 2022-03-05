Connect-AzAccount

$context = Get-AzSubscription -SubscriptionName 'BizSpark-Applipets'
Set-AzContext $context

Set-AzDefault -ResourceGroupName 'rglab13500'

New-AzResourceGroupDeployment -TemplateFile 'template.bicep' -Name 'TestDeployment'

