output "rg_name" {
  description = "value of the resource group name"
  value       = module.resource_group.rg_name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.network.vnet_name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = module.network.vnet_address_space
}

output "subnet_name" {
  description = "The name of the first subnet"
  value       = module.network.subnet_name
}

output "subnet_address_space" {
  description = "The address space of the first subnet"
  value       = module.network.subnet_address_space
}

output "log_analytics_workspace_name" {
  description = "value of the log analytics workspace name"
  value       = module.common.law_name
}

output "recovery_services_vault_name" {
  description = "value of the recovery services vault name"
  value       = module.common.rsv_name
}

output "storage_account_name" {
  description = "value of the storage account name"
  value       = module.common.sa_name
}

output "linux_vm_host_names" {
  description = "The names of the linux virtual machines"
  value       = module.vm_linux.vm_hostnames
}

output "linux_vm_private_ips" {
  description = "The private IP addresses of the linux virtual machines"
  value       = module.vm_linux.vm_private_ips
}

output "linux_vm_public_ips" {
  description = "The public IP addresses of the linux virtual machines"
  value       = module.vm_linux.vm_public_ips
}

output "linux_vm_fqdns" {
  description = "The Fully Qualified Domain Name (FQDN) of the linux virtual machines"
  value       = module.vm_linux.vm_fqdns
}

output "linux_availability_set_name" {
  description = "The name of the linux Availability Set"
  value       = module.vm_linux.availability_set_name
}

output "windows_vm_host_names" {
  description = "The names of the windows virtual machines"
  value       = module.vm_windows.vm_hostnames
}

output "windows_vm_private_ips" {
  description = "The private IP addresses of the windows virtual machines"
  value       = module.vm_windows.vm_private_ips
}

output "windows_vm_public_ips" {
  description = "The public IP addresses of the windows virtual machines"
  value       = module.vm_windows.vm_public_ips
}

output "windows_vm_fqdns" {
  description = "The Fully Qualified Domain Name (FQDN) of the windows virtual machines"
  value       = module.vm_windows.vm_fqdns
}

output "windows_availability_set_name" {
  description = "The name of the windows Availability Set"
  value       = module.vm_windows.availability_set_name
}

output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = module.load_balancer.lb_name
}

output "database_server_name" {
  description = "The name of the database server"
  value       = module.database.db_server_name
}

output "database_name" {
  description = "The name of the database"
  value       = module.database.db_name
}