output "availability_set_name" {
  value       = azurerm_availability_set.availability_set.name
  description = "The name of the CentOS Availability Set"
}

output "vm_hostnames" {
  description = "The hostnames of the Linux virtual machines"
  value       = values(azurerm_linux_virtual_machine.linux_vm)[*].name
}

output "vm_fqdns" {
  description = "The domain names of the Linux virtual machines"
  value       = values(azurerm_public_ip.public_ip)[*].fqdn
}

output "vm_private_ips" {
  description = "The private IP addresses of the Linux virtual machines"
  value       = values(azurerm_network_interface.nic)[*].private_ip_address
}

output "vm_public_ips" {
  description = "The public IP addresses of the Linux virtual machines"
  value       = values(azurerm_public_ip.public_ip)[*].ip_address
}

output "vm_ids" {
  description = "The ID's of the Linux virtual machine"
  value       = values(azurerm_linux_virtual_machine.linux_vm)[*].id
}

output "vm_nic_ids" {
  description = "The NIC ID's of the Linux virtual machine"
  value       = values(azurerm_network_interface.nic)[*].id
}