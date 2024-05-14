# Bicep object sample

Demonstrates how a custom JSON object can be read from a file as an input for a Bicep deployment.

## Pre-requisites

Assumed operating system is Linux ([WSL](https://learn.microsoft.com/en-us/windows/wsl/install) can be used).

1. Install the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt) and login.

    ``` bash
    # Login
    az login
    ```

1. Select the target subscription

    ``` bash
    # Show all accounts
    az account list --query "[][name, id]"

    # Set account (subscription) by id
    az account set --subscription "xxxx-xx-xx-xxxx"
    ```

## Usage

Run this sample using the provided [Makefile](https://makefiletutorial.com/).

```bash
# Start the deployment
make
```

Deploying this sample produces the following outputs.

``` json
"outputs": {
  "mock_app_deployment": {
    "type": "Array",
    "value": [
      {
        "app": "App1",
        "ilb": {
          "backends": [
            {
              "name": "vm1-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm1-nic"
            },
            {
              "name": "vm2-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm2-nic"
            }
          ],
          "name": "ilb-App2"
        }
      },
      {
        "app": "App2",
        "ilb": {
          "backends": [
            {
              "name": "vm3-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm3-nic"
            },
            {
              "name": "vm4-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm4-nic"
            }
          ],
          "name": "ilb-App2"
        }
      },
      {
        "app": "App3",
        "ilb": {
          "backends": [
            {
              "name": "vm5-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm5-nic"
            },
            {
              "name": "vm6-nic",
              "nic": "/subscriptions/xxxx-xxxx/.../vm6-nic"
            }
          ],
          "name": "ilb-App2"
        }
      }
    ]
  }
}
```