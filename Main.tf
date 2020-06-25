provider "azurerm" {
  version = "2.15.0"

#Authentication for my Azure subscription. Create and change to KG after testing
client_id = var.clientid
client_secret = var.CLIENT_SECRET
subscription_id = var.subscriptionid
tenant_id = var.tenantid

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
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  
  tags = {
    CreatedBy = "KG"
  }
}

resource "azurerm_sql_firewall_rule" "main" {
  name                = var.fwrule
  resource_group_name = azurerm_resource_group.RG.name
  server_name         = azurerm_sql_server.sqlserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_database" "DB" {
  name                = var.SqlDB
  resource_group_name = azurerm_resource_group.RG.name
  server_name         = azurerm_sql_server.sqlserver.name
  location            = azurerm_resource_group.RG.location  
}

resource "azurerm_app_service_plan" "asplan" {
  name                = var.appserviceplan
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "function" {
  name                      = var.AzFunction
  location                  = azurerm_resource_group.RG.location
  resource_group_name       = azurerm_resource_group.RG.name
  app_service_plan_id       = azurerm_app_service_plan.asplan.id
  storage_account_name      = azurerm_storage_account.storageaccount.name
  storage_account_access_key = azurerm_storage_account.storageaccount.primary_access_key
}



resource "azurerm_app_service" "appservice01" {
  name                = var.appservice01
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  app_service_plan_id = azurerm_app_service_plan.asplan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}

resource "azurerm_app_service" "appservice02" {
  name                = var.appservice02
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  app_service_plan_id = azurerm_app_service_plan.asplan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}