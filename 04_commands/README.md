# Terraform Commands

## init & apply
Die beiden Commands kennt ihr bereits.


## validate
Mache bewusst einen Syntax Fehler in deinem Projekt und führe dann `terraform validate` aus.
```shell
terraform validate
```

Nutze bewusst ein nicht existierendes Attribut in deinem Projekt und führe dann `terraform validate` aus.
```shell
terraform validate
```

## plan
Mache eine Änderung an deinem Terraform Projekt. Zum Beispiel ein weiteres Subnet:

```diff
# main.tf
resource "azurerm_virtual_network" "my_vnet" {

+  subnet {
+    name           = "subnet3"
+    address_prefix = "10.0.3.0/24"
+  }
```

### nur als Ausgabe
```shell
terraform plan
```

### als Datei speichern
```shell
terraform plan -out plan.out
```

### plan anschauen
```shell
terraform show plan.out
```

### plan anwenden
```shell
terraform apply plan.out
```

### Saved plan is stale
```shell
terraform apply plan.out
```

### Replace?
```diff
# main.tf
 resource "azurerm_virtual_network" "my_vnet" {
-  name                = "my-vnet"
+  name                = "my-updated-vnet"
   location            = "germanywestcentral"
   resource_group_name = "kevin.schu-rg"
```

```shell
terraform plan
```

## destroy
### target
```shell
terraform destroy --target azurerm_virtual_network.my_vnet
```
### alles
```shell
terraform destroy
```
### wiederherstellen
```shell
terraform apply -auto-approve
```

## taint & untaint
```shell
terraform taint azurerm_virtual_network.my_vnet
```
```shell
terraform plan
```
```shell
terraform untaint azurerm_virtual_network.my_vnet
```

## fmt
```shell
terraform fmt -diff
```

## graph
```shell
terraform graph
```
```shell
terraform graph -plan=plan.out
```
DOT-Format kann z.B unter [GraphvizOnline](https://dreampuf.github.io/GraphvizOnline/) zum Graphen generiert werden. Oder lokal mit [GraphViz](https://graphviz.org/).