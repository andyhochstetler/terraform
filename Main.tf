provider "azurerm" {
  version = "2.14.0"

#Authentication for my Azure subscription. Create and change to KG after testing
client_id = "7113e233-5e62-4729-abb2-dd8d93c17829"
client_secret = var.CLIENT_SECRET
subscription_id = "c8410b57-3aee-4653-a685-c8a08a902609"
tenant_id = "44708537-d2aa-4dbf-866e-56f8e706db4b"

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