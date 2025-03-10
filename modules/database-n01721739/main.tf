resource "azurerm_postgresql_server" "db_server" {
  name                         = var.db_server_name
  location                     = var.location
  resource_group_name          = var.rg_name
  version                      = "11"
  sku_name                     = "B_Gen5_1"
  storage_mb                   = var.storage_mb
  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "db" {
  name                = var.db_name
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.db_server.name
  charset             = "UTF8"
  collation           = "en_US.utf8"
}
