# Stacks

## Übungsaufgabe
Teile dein Projekt in zwei Stacks auf. Trenne das Netzwerk und die Virtual Machines jeweils in einen eigenen Stack auf.
Jeder Stack hat dabei seinen eigenen State und seine eigene Provider Definition.

### Hilfestellung
#### Ordnerstruktur
```shell
my-virtual-machine/
  stacks/
    100_network/
      main.tf
      providers.tf
      state.tf
    200_virtual_machines/
      main.tf
      providers.tf
      state.tf
```

#### State
```shell
# 100_network

terraform {
  backend "azurerm" {
    resource_group_name  = "kevin.schu-rg"
    storage_account_name = "kevinschutfstate"
    container_name       = "100_network"
    key                  = "terraform.tfstate"
  }
}
```
```terraform
# 200_virtual_machines

terraform {
  backend "azurerm" {
    resource_group_name  = "kevin.schu-rg"
    storage_account_name = "kevinschutfstate"
    container_name       = "200_virtual_machines"
    key                  = "terraform.tfstate"
  }
}
```

#### Austausch von Abhängigkeiten
##### via data source
```terraform
data "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  resource_group_name = data.azurerm_resource_group.my_rg.name
}

# data.azurerm_virtual_network.my_vnet.address_space
```

##### via remote state
```terraform
# 100_network

output "my_vnet_address_space" {
  value = azurerm_virtual_network.my_vnet.address_space
}
```
```terraform
# 200_virtual_machines

data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "kevin.schu-rg"
    storage_account_name = "kevinschutfstate"
    container_name       = "100_network"
    key                  = "terraform.tfstate"
  }
}

# data.terraform_remote_state.network.outputs.my_vnet_address_space
```