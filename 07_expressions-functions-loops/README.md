# Ausdrücke, Funktionen und Schleifen

## Funktionen
Ersetze die Subnetz CIDR Definitionen durch eine Funktion.

```terraform
resource "azurerm_virtual_network" "my_vnet" {
  # ...
  
  address_space       = [var.address_space]
  dns_servers         = [cidrhost(var.address_space, 4), cidrhost(var.address_space, 5)]

  subnet {
    name           = "subnet1"
    address_prefix = cidrsubnet(var.address_space, 8, 1)
  }

  subnet {
    name           = "subnet2"
    address_prefix = cidrsubnet(var.address_space, 8, 2)
  }

  subnet {
    name           = "subnet3"
    address_prefix = cidrsubnet(var.address_space, 8, 3)
  }

  # ...
}
```

## Dynamic Blocks
Ersetze die Subnetz Blocks durch einen dynamischen Block Ausdruck.

```terraform
resource "azurerm_virtual_network" "my_vnet" {
  // ...

  dynamic "subnet" {
    for_each = range(1, var.number_of_subnets + 1)
    content {
      name           = "subnet${subnet.value}"
      address_prefix = cidrsubnet(var.address_space, 8, subnet.value)
    }
  }

  // ...
}
```

## Übungsaufgabe
Die `azurerm_virtual_network`´s sollen dynamisch über eine Variable angelegt werden.
Dabei ist zu beachten, dass jedes `azurerm_virtual_network` seinen eigenen IP Adressbereich bekommen soll.

Hinweis: Es gibt unterschiedliche Möglichkeiten die Aufgabe zu lösen.