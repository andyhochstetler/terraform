
variable "CLIENT_SECRET" {
    description = "Will prompt for client secret, found in secret server"
}

variable "clientid" {
    type = string
    description = "Azure Application ID"
}

variable "subscriptionid" {
    type = string
    description = "Azure subscription ID"
}

variable "tenantid" {
    type = string
    description = "Azure Directory (tenant) ID"
}

variable "location" {
    type = string
    description = "Azure DC location"
    default = "Central US"
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

variable "administrator_login"{
    type = string
}


  variable "administrator_login_password"{
      type = string
  }


variable "fwrule" {
    type = string
    description = "Firewall rule to allow Azure service to connect to DB server"
}

variable "appservice01" {
    type = string
    description = "App Service name"
}

variable "appservice02" {
    type = string
    description = "App Service name"
}

variable "appserviceplan" {
    type = string
    description = "App service plan name"
}
