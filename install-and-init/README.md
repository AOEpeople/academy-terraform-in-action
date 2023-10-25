## Installation

[Installiere terraform in der Version 1.5.7](https://developer.hashicorp.com/terraform/downloads)

## Initialisierung

### Vorbereitung
```shell
mkdir my-terraform-project && cd my-terraform-project
```

### Init
```shell
terraform init
```

### Terraform initialized in an empty directory?

```shell
# main.tf
resource "random_pet" "my-server-name" {}
```
_[-> main.tf](main.tf)_

```shell
terraform init
```

### Welche Dateien und Ordner wurden angelegt? 

```shell
ls -aR
```

## Mein erster apply
```shell
terraform apply
```
### Was ist dazu gekommen?

```shell
ls -la
```
```shell
cat terraform.tfstate
```