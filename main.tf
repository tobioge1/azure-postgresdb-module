# Creates PostgreSQL Server
resource "azurerm_postgresql_server" "server" {
  name                         = "psql-${var.identifier}-${var.environment}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = var.server_version
  sku_name                     = var.sku_name
  ssl_enforcement_enabled      = false
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_password

  tags = var.tags
}

# Creates PostgreSQL Server Firewall
resource "azurerm_postgresql_firewall_rule" "firewall" {
  name                = "pgfw-${var.identifier}-${var.environment}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}

# Creates PostgreSQL Database
resource "azurerm_postgresql_database" "postgres" {
  name                = "${var.database_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = var.charset
  collation           = var.collation
}