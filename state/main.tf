resource "azurerm_public_ip" "my_ip" {
  name                = "my-ip"
  resource_group_name = data.azurerm_resource_group.my_rg.name
  location            = data.azurerm_resource_group.my_rg.location
  allocation_method   = "Static"
}

# terraform import azurerm_public_ip.my_ip "/subscriptions/4e79f499-5512-4fc7-95f7-e642538e50aa/resourceGroups/kevin.schu-rg/providers/Microsoft.Network/publicIPAddresses/my-ip"