# Variabales

## define & use variables

```terraform
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

_[-> main.tf](main-1.tf)_

```shell
terraform apply
```

## pass variables

```shell
terraform apply -var="address_space=10.0.0.0/16"
```