resource "azurerm_public_ip" "lb_publicip" {
  name = "${local.resource_name_prefix}-lbpublicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
  tags = local.common_tags
}

resource "azurerm_lb" "lb" {
  name = "${local.resource_name_prefix}-lb"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku = "Standard"

  frontend_ip_configuration {
    name = "lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.lb_publicip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  name = "lb-backend"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.lb.id
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_lb_rule" "lb_rule_wp" {
  name = "wp-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.lb_backend_address_pool.id ]
  probe_id = azurerm_lb_probe.lb_probe.id
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_associate" {
  network_interface_id = azurerm_network_interface.wordpress_linuxvm_nic.id
  ip_configuration_name = azurerm_network_interface.wordpress_linuxvm_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_address_pool.id
}