output "availability_set_name" {
  description = "The name of the Windows Availability Set"
  value       = azurerm_availability_set.availability_set.name
}

output "vm_hostnames" {
  description = "The names of the Windows virtual machines"
  value       = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "vm_fqdns" {
  description = "The Fully Qualified Domain Name (FQDN) of the Windows virtual machines"
  value       = azurerm_public_ip.public_ip[*].fqdn
}

output "vm_private_ips" {
  description = "The private IP addresses of the Windows virtual machines"
  value       = azurerm_network_interface.nic[*].private_ip_address
}

output "vm_public_ips" {
  description = "The public IP addresses of the Windows virtual machines"
  value       = azurerm_public_ip.public_ip[*].ip_address
}

output "vm_ids" {
  description = "The ID's of the windows virtual machine"
  value       = azurerm_windows_virtual_machine.windows_vm[*].id
}

output "vm_nic_ids" {
  description = "The NIC ID's of the Windows virtual machine"
  value       = azurerm_network_interface.nic[*].id
}
