# Lab

## auf der Grüne Wiese starten

```bash
terraform destroy
```

## Aufgaben

- Eine VM (Linux) erstellen
  - beginne im neu in einem leeren Verzeichnis (`my-virtual-machine`)
  - die benötigte Ressource in der Provider Doku suchen
  - VM Size: `Standard_B1s`
  - Ergebnisse immer wieder im Portal überprüfen

- per SSH verbinden
  - Tipps: 
    - Public IP verwenden aber Zugriff auf die [eigene IP](https://ifconfig.co) beschränken
    - [tls_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)

- eine 2. und 3. identische VM anlegen
  - platziere die VMs in unterschiedlichen Subnetzen
  - nutze Funktionen:
    - [count](https://www.terraform.io/docs/language/meta-arguments/count.html)
    - [format](https://www.terraform.io/docs/language/functions/format.html) 