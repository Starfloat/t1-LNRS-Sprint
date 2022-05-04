# Public IP Outputs
output "wordpress_linuxvm_public_ip" {
  description = "Wordpress Linux VM Public IP"
  value       = azurerm_public_ip.wordpress_linuxvm_publicip.ip_address
}

# Network Interface Outputs
output "wordpress_linuxvm_network_interface_id" {
  description = "Wordpress Network Interface ID"
  value       = azurerm_network_interface.wordpress_linuxvm_nic.id
}

output "wordpress_linuxvm_network_interface_private_ip_addresses" {
  description = "Wordpress Linux VM Private IP Addresses"
  value       = [azurerm_network_interface.wordpress_linuxvm_nic.private_ip_addresses]
}

# Linux VM Outputs
output "wordpress_linuxvm_public_ip_addresses" {
  description = "Wordpress Linux Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.wordpress_linuxvm.public_ip_address
}

output "wordpress_linuxvm_private_ip_address" {
  description = "Wordpress Linux Virtual Machine Private IP"
  value       = azurerm_linux_virtual_machine.wordpress_linuxvm.private_ip_address
}

output "wordpress_linuxvm_virtual_machine_id" {
  description = "Wordpress Linux Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.wordpress_linuxvm.id
}
