
variable "CLIENT_SECRET" {
    description = "Will prompt for client secret, found in secret server"
}

vairable "client_id" {
    type = string
    description = "Azure Application ID"
}

vairable "subscription_id" {
    type = string
    description = "Azure subscription ID"
}

variable "tenant_id" {
    type = string
    description "Azure Directory (tenant) ID"
}

variable "location" {
    type = string
    description = "Azure DC location"
}

variable "RG" {
    type = string
    description = "Resource Group"
}

variable "ServerName" {
    type = string
    description = "Server name of the virtual machine"
}

variable "StorageAccount" {
    type = string
    description = "Storage Account Name"

}

variable "SqlDB" {

    type = string
    description = "SQL DB server name"
}

variable "AppServicePlan" {

    type = string
    description = "App service plan Name"
}

variable "AppService1" {

    type = string
    description = "App service name"

}

variable "AppService2" {

    type = string
    description = "App service2 name"
}

variable "AzFunction" {

    type = string
    description = "Function name"
}

variable "administrator_login"{}


  variable "administrator_login_password"{}