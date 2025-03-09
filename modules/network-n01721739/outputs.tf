output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.network_vnet.name
}

output "vnet_address_space" {
  description = "Address space of the virtual network"
  value       = azurerm_virtual_network.network_vnet.address_space
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "Name of the first subnet"
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_space" {
  description = "Address space of the first subnet"
  value       = azurerm_subnet.subnet.address_prefixes
}

output "nsg_name" {
  description = "Name of the first Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}
