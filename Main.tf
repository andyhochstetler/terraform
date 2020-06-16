provider "azurerm" {
  version = "2.0.0"
  features {}
}
resource "azurerm_resource_group" "RG" {
  name     = var.RG
  location = var.location
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = var.StorageAccount
  resource_group_name      = azurerm_resource_group.RG.name
  location                 = azurerm_resource_group.RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = var.ServerName
  resource_group_name          = azurerm_resource_group.RG.name
  location                     = azurerm_resource_group.RG.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  
  tags = {
    CreatedBy = "KG"
  }
}

/*
data "azurerm_sql_database" "Sql_DB" {
  name                = var.SqlDB
  server_name         = azurerm_sql_server.sqlserver.name
  resource_group_name = azurerm_resource_group.RG.name
}

output "sql_database_id" {
  value = data.azurerm_sql_database.Sql_DB.id
}
*/