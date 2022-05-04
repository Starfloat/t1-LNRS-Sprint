resource "azurerm_network_interface" "wordpress_linuxvm_nic" {
  name                = "${local.resource_name_prefix}-wordpress-linuxvm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.resource_group_name

  ip_configuration {
    name                          = "${local.resource_name_prefix}-wordpress-linuxvm-ip-1"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.wordpresssubnet.id
    public_ip_address_id          = azurerm_public_ip.wordpress_linuxvm_publicip.id
  }
}
