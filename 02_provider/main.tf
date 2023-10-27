data "azurerm_client_config" "myself" {}

output "myself_object_id" {
  value = data.azurerm_client_config.myself.object_id
}