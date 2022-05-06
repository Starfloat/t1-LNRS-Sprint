
resource "azurerm_mysql_server" "mysql_server" {
  name                = "${local.resource_name_prefix}-${var.mysql_db_name}-server-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login          = var.mysql_db_username
  administrator_login_password = var.mysql_db_password

  version    = "8.0"
  sku_name   = "GP_Gen5_2"
  storage_mb = 5120

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"

  tags = local.common_tags
}

resource "azurerm_mysql_database" "mysql_database" {
  name                = var.mysql_db_schema
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

}

resource "azurerm_mysql_firewall_rule" "mysql_fw_rule" {
  name                = "allow-access-from-linuxvm-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = azurerm_public_ip.wordpress_linuxvm_publicip.ip_address
  end_ip_address      = azurerm_public_ip.wordpress_linuxvm_publicip.ip_address
}

resource "azurerm_mysql_virtual_network_rule" "azurerm_mysql_virtual_network_rule" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql_server.name
  subnet_id           = azurerm_subnet.wordpress_subnet.id
}
