# Variabales

## definieren und benutzen

```terraform
# main.tf
variable "address_space" {
  description = "Adressraum des VNETs z.B. 10.0.0.0/16"
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  location            = data.azurerm_resource_group.my_rg.location
  resource_group_name = data.azurerm_resource_group.my_rg.name
  address_space       = [var.address_space]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}
```

```shell
terraform apply
```

## pass variables

```shell
terraform apply -var="address_space=10.0.0.0/16"
```

## terraform.tfvars

```terraform
# terraform.tfvars
address_space = "10.0.0.0/16"
```


```shell
terraform apply
```

## terraform.tfvars.json

```json
# terraform.tfvars.json
{
  "address_space": "10.0.0.0/16"
}
```

## terraform.tfvars in dev.tfvars umbenennen

```shell
terraform apply
```

```shell
terraform apply -var-file="dev.tfvars"
```

## in dev.auto.tfvars umbenennen

```shell
terraform apply
```

## environment Variable hinzufügen

```terraform
# variables.tf
variable "environment" {
  type = string
}
```

```terraform
# dev.tfvars
environment = "dev"
```


```shell
terraform apply
```

## environment Variable in Ressourcen Namen verwenden

```terraform
# main.tf
resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet-${var.environment}"
  location            = data.azurerm_resource_group.my_rg.location
  resource_group_name = data.azurerm_resource_group.my_rg.name
  address_space       = [var.address_space]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}
```

## eine Variable KST vom Typ Number anlegen und als Tag verwenden

```terraform
  # main.tf
  tags = {
    KST = var.kst
  }
```
mal mit einem String testen

## var.address_space als Liste definieren

```terraform
# variables.tf
variable "address_space" {
  type = list(string)
}
```

## variablen defaults setzen

```terraform
# variables.tf
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
```

## TF_VAR_environment nutzen

Linux:

```shell
export TF_VAR_environment="staging"
```
Powershell:
```shell
$env:TF_VAR_environment="staging"
```

