targetScope = 'subscription'
param resourceGroupName string = ''
param location string = deployment().location
output name string = rg.name

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
