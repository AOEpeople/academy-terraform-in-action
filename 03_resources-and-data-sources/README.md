# Resources & Data Sources

## Resource: Virtual Network

```terraform
# main.tf
resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  location            = "germanywestcentral"
  resource_group_name = "kevin.schu-rg"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}
```
_[-> main.tf](main-1.tf)_

```shell
terraform apply
```

## Data Source: Resource Group

```terraform
# main.tf
data "azurerm_resource_group" "my_rg" {
  name = "kevin.schu-rg"
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  location            = data.azurerm_resource_group.my_rg.location
  resource_group_name = data.azurerm_resource_group.my_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}
```
_[-> main.tf](main-2.tf)_

```shell
terraform apply
```