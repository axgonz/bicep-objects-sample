targetScope = 'subscription'

var apps = loadJsonContent('applications.json')

module ilb 'modules/ilb.bicep' = [for app in apps: {
  name: 'deploy-ilb-for-${app.name}'
  params: {
    name: 'ilb-${app.name}'
    nicIds: app.endpoints
  }
}]

output mock_app_deployment array = [for (app, i) in apps: {
  app: app.name
  ilb: {
    name: ilb[1].outputs.name
    backends: ilb[i].outputs.mock_ilb_entries
  }
}]
