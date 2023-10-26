# Terraform State & Output

## State Handling
### Ansehen via show als HCL
```shell
terraform show
```
### im Rohformat ansehen

```shell
terraform state pull
```
oder (nur bei local state backend)
```shell
cat terraform.tfstate
```

### eine resource aus dem state entfernen
```shell
terraform state list
```
```shell
terraform state rm azurerm_virtual_network.my_vnet
```
```shell
terraform apply
```



## State Import
### fehlende Ressource wieder ergänzen
State muss importiert werden, da Ressource nicht über Terraform gemanaged ist.
```shell
terraform import azurerm_virtual_network.my_vnet "/subscriptions/4e79f499-5512-4fc7-95f7-e642538e50aa/
resourceGroups/kevin.schu-rg/providers/Microsoft.Network/virtualNetworks/my-vnet"
```
```shell
terraform apply
```
### Übungsaufgabe
```shell
az network public-ip create -g kevin.schu-rg -n my-ip
```
Erweiter dein Terraform Projekt um die IP Adresse ([azurerm_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)) und importiere den state dazu.



## Remote State
### storage account erstellen
```shell
az storage account create --resource-group kevin.schu-rg --name kevinschutfstate --sku Standard_LRS --encryption-services blob
az storage container create --name tfstate --account-name kevinschutfstate
```

### remote state konfigurieren
```terraform
# state.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "kevin.schu-rg"
    storage_account_name = "kevinschutfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```
_[-> state.tf](state.tf)_

### state nutzen
```shell
terraform apply
```
-> `Error: Backend initialization required, please run "terraform init"`

```shell
terraform init
```
oder
```shell
terraform init -migrate-state
```



## Output

### Public IP ausgeben
```terraform
output "public_ip" {
  value = azurerm_public_ip.my_ip.ip_address
}
```
```shell
terraform output
```

### Übungsaufgabe
...