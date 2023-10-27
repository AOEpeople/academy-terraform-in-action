# Provider

## azurerm Provider

```terraform
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

```shell
terraform init
```

## random Provider ergänzen

```shell
terraform providers
```

```terraform
# providers.tf
terraform {
  required_providers {
    // ...
    random = {
      source = "hashicorp/random"
      version = "3.5.0"
    }
  }
}
```

```shell
terraform init
```

### Failed to query available provider packages?
```shell
terraform init -upgrade
```

## azurerm Provider nutzen
```terraform
# main.tf
data "azurerm_client_config" "myself" {}

output "myself_object_id" {
  value = data.azurerm_client_config.myself.object_id
}
```

```shell
terraform apply
```