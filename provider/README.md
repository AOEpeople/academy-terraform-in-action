# Provider

## azurerm Provider

```shell
# providers.tf
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```
_[-> providers.tf](providers.tf)_

```shell
terraform init
```

## random Provider ergänzen

```
# providers.tf
terraform {
  required_providers {
    ...
    random = {
      source = "hashicorp/random"
      version = "3.5.0"
    }
  }
}
```
_[-> providers.tf](providers.tf)_

```shell
terraform init
```

### Failed to query available provider packages?
```shell
terraform init -upgrade
```

## azurerm Provider nutzen
```
# main.tf
data "azurerm_client_config" "myself" {}

output "myself_object_id" {
  value = data.azurerm_client_config.myself.object_id
}
```
_[-> main.tf](main.tf)_

```shell
terraform apply
```