targetScope = 'subscription'

param name string
param nicIds array

var nicNames = [for nicId in nicIds: last(split(nicId, '/'))]

output name string = name
output mock_ilb_entries array = [for (nicId, i) in nicIds: {
  name: nicNames[i]
  nic: nicId
}]
