resource "azurerm_public_ip" "wordpress_linuxvm_publicip" {
  name                = "${local.resource_name_prefix}-wordpressvm-publicip"
  resource_group_name = azurerm_resource_group.rg.resource_group_name
  location            = azurerm_resource_group.rg.location
}
