# Module

## eine Daten Festplatte an die Lab VM anhängen

siehe [azurerm_virtual_machine_data_disk_attachment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment)

```terraform
name = <name-der-vm>-disk1
```

## VM und die Daten Festplatte in einem Modul kapseln


```terraform
module "my_vm" {
  source = "./modules/vm"

  name = "my-vm"
  size = "Standard_B1s"

  data_disk = true
  [...]
}
```

```shell
./modules/vm/
  main.tf
  variables.tf
  outputs.tf
```

## Modul für VNETs inkl. Subnet anlegen und Ressourcen verschieben

```shell
./modules/vnet/
  main.tf
  variables.tf
  outputs.tf
```

```terraform
moved {
  from = <vnet>
  to  = <module.vnet> 
}
```