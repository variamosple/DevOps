# Description

After the Pull Request to the main branch the App Service doesn't update with the latest version of the generated conatiner image.

## Error message 01:

ERROR - failed to register layer: Error processing tar file(exit status 1): Container ID 1516583083 cannot be mapped to a host IDErr: 0, Message: failed to register layer: Error processing tar file(exit status 1): Container ID 1516583083 cannot be mapped to a host ID

## Error message 02:

ERROR - DockerApiException: Docker API responded with status code=InternalServerError, response={"message":"Get https://variamos.azurecr.io/v2/variamos/variamos_ms_languages/manifests/c1ab068b530f211c93d2629a8f9326ec48f557c7: unauthorized: authentication required, visit https://aka.ms/acr/authorization for more information."}

## Solution for Error message 02

[Migrate custom software to Azure App Service using custom container](https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?pivots=container-linux&tabs=azure-cli)

https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?pivots=container-linux&tabs=azure-cli

**It worked**

1. Create a managed identity for the resoruce group

`az identity create --name VariamossplaMgId --resource-group variamosspla`

2. Authorize the managed identity for your registry

`$principalId=$(az identity show --resource-group variamosspla --name VariamossplaMgId --query principalId --output tsv)`

`$registryId=$(az acr show --resource-group variamosspla --name variamos --query id --output tsv)`

`az role assignment create --assignee $principalId --scope $registryId --role "AcrPull"`

3. Configure the web app

`az webapp config appsettings set --resource-group variamosspla --name variamos-ms-languages --settings WEBSITES_PORT=4000`

`$id=$(az identity show --resource-group variamosspla --name VariamossplaMgId --query id --output tsv)`

`az webapp identity assign --resource-group variamosspla --name variamos-ms-languages --identities $id`

`$appConfig=$(az webapp config show --resource-group variamosspla --name variamos-ms-languages --query id --output tsv)`

`az resource update --ids $appConfig --set properties.acrUseManagedIdentityCreds=True`

`$clientId=$(az identity show --resource-group variamosspla --name VariamossplaMgId --query clientId --output tsv)`

`az resource update --ids $appConfig --set properties.AcrUserManagedIdentityID=$clientId`

`$cicdUrl=$(az webapp deployment container config --enable-cd true --name variamos-ms-languages --resource-group variamosspla --query CI_CD_URL --output tsv)`

`az acr webhook create --name VariamosMsLanguagesCD --registry variamos --uri $cicdUrl --actions push --scope variamos_ms_languages:latest`

4. Udapte ACR SKU 

Update variamos ACR SKU to Standard, because Basic SKU only supports two webhooks.

## Solution for Error message 01

In progress

az container restart --name  --resource-group variamosspla --no-wait
