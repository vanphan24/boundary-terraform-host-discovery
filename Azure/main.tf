# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


### This TF code will list AKS clusters, postgres db, and mysql db instance on Azure, and dynamically add them to
### your existing Boundary cluster's host catalog. Since the official azurerm provider does not have an equivelent
### AWS data source to list resources (AKS clusters, db instances, etc), we will use a provider from azapi to list them. 
### If you want to add additional Azure resources, copy/paste additonal "azapi_resource_list" & "boundary_host_static" resource blocks 
### similar to code below for AKS, postgres, and mysql.


provider "azapi" {}

provider "boundary" {
  addr                   = var.boundary_addr
  auth_method_id         = var.boundary_auth_method_id
  auth_method_login_name = var.boundary_login_name
  auth_method_password   = var.boundary_password
}



### CREATE NEW BOUNDARY HOST CATALOG ###

resource "boundary_host_catalog_static" "my_host_catalog_azure" {
  name        = "My new Azure host catalog"
  description = "My new Azure host catalog via Terraform!"
  scope_id    = var.boundary_scope_id
}




### RETRIEVE AND LIST AZURE AKS CLUSTERS ###
# See azapi provider docs for reference: https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list 
# The type field AKS can be reference from https://learn.microsoft.com/en-us/rest/api/aks/operations/list?view=rest-aks-2024-09-01&tabs=HTTP

data "azapi_resource_list" "listBySubscription" {
  type      = "Microsoft.ContainerService/managedClusters@2024-09-01" # Change type to match desired resource type you are importing to Boundary
  parent_id = "/subscriptions/${var.azure_subscription}"
  response_export_values = {
    "values" = "value[].{name: name, fqdn: properties.fqdn}"
  }
}

### ADD AKS CLUSTERS TO BOUNDARY HOST CATALOG ###

resource "boundary_host_static" "aks" {
  type            = "static"
  name            = each.value.name
  description     = "AKS cluster ${each.value.name} added via TF. "
  address         = each.value.fqdn
  host_catalog_id = boundary_host_catalog_static.my_host_catalog_azure.id
  for_each = {for cluster in data.azapi_resource_list.listBySubscription.output.values: cluster["name"] => cluster}
  # for_each code suggested by Benjamin L to convert data type
}


### RETRIEVE AND LIST AZURE DATABASE FOR POSTGRES (flexible server type) ###

# See azapi provider docs for reference: https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list 
# The type field for Azure postgres database (flexible) can be referenced from
# https://learn.microsoft.com/en-us/azure/templates/microsoft.dbforpostgresql/flexibleservers/databases?pivots=deployment-language-terraform

data "azapi_resource_list" "postgresListBySubscription" {
  type      = "Microsoft.DBforPostgreSQL/flexibleServers@2024-11-01-preview" # Change type to match desired resource type you are importing to Boundary
  parent_id = "/subscriptions/${var.azure_subscription}"
  response_export_values = {
    "values" = "value[].{name: name, fqdn: properties.fullyQualifiedDomainName}"
  }
}

### ADD POSTGRES DB TO BOUNDARY HOST CATALOG ###

resource "boundary_host_static" "postgres" {
  type            = "static"
  name            = each.value.name
  description     = "Database ${each.value.name} added via TF. "
  address         = each.value.fqdn
  host_catalog_id = boundary_host_catalog_static.my_host_catalog_azure.id
  for_each = {for cluster in data.azapi_resource_list.postgresListBySubscription.output.values: cluster["name"] => cluster}
  # for_each code suggested by Benjamin L to convert data type
}


### RETRIEVE AND LIST AZURE DATABASE FOR MYSQL (flexible server type) ###

# See azapi provider docs for reference: https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list 
# The type field for Azure mysql database (flexible) can be referenced from
# https://learn.microsoft.com/en-us/azure/templates/microsoft.dbformysql/2024-10-01-preview/flexibleservers?pivots=deployment-language-terraform 

data "azapi_resource_list" "mysqlListBySubscription" {
  type      = "Microsoft.DBforMySQL/flexibleServers@2024-10-01-preview" # Change type to match desired resource type you are importing to Boundary
  parent_id = "/subscriptions/${var.azure_subscription}"
  response_export_values = {
    "values" = "value[].{name: name, fqdn: properties.fullyQualifiedDomainName}"
  }
}


### ADD MYSQL DB TO BOUNDARY HOST CATALOG ###

resource "boundary_host_static" "mysql" {
  type            = "static"
  name            = each.value.name
  description     = "Database ${each.value.name} added via TF. "
  address         = each.value.fqdn
  host_catalog_id = boundary_host_catalog_static.my_host_catalog_azure.id
  for_each = {for cluster in data.azapi_resource_list.mysqlListBySubscription.output.values: cluster["name"] => cluster}
  # for_each code suggested by Benjamin L to convert data type
}


