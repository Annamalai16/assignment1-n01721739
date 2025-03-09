output "law_name" {
  description = "The name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.law.name
}

output "rsv_name" {
  description = "The name of the Recovery Services Vault."
  value       = azurerm_recovery_services_vault.rv.name
}

output "sa_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.sa.name
}

output "storage_account_uri" {
  description = "The URI for the created storage account"
  value       = "https://${azurerm_storage_account.sa.name}.blob.core.windows.net"
}