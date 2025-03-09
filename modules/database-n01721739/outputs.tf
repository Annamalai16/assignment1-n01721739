output "db_server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_server.db_server.name
}

output "db_name" {
  description = "The name of the PostgreSQL database"
  value       = azurerm_postgresql_database.db.name
}