resource "azurerm_subnet" "wordpress_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.wordpress_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.wordpress_subnet_address
  service_endpoints = [ "Microsoft.Sql" ]
}

resource "azurerm_network_security_group" "wordpress_subnet_nsg" {
  name                = azurerm_subnet.wordpress_subnet.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "wordpress_subnet_nsg_associate" {
  depends_on                = [azurerm_network_security_rule.wordpress_nsg_rule_inbound]
  subnet_id                 = azurerm_subnet.wordpress_subnet.id
  network_security_group_id = azurerm_network_security_group.wordpress_subnet_nsg.id
}

locals {
  web_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "22"
    "130" : "8080"
  }
}
resource "azurerm_network_security_rule" "wordpress_nsg_rule_inbound" {
  for_each                    = local.web_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.wordpress_subnet_nsg.name
}
