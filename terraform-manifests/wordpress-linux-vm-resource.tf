resource "azurerm_linux_virtual_machine" "wordpress_linuxvm" {
  name                  = "${local.resource_name_prefix}-wordpress-linuxvm"
  computer_name         = "wordpress-linux-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_DS1"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.wordpress_linuxvm_nic.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
