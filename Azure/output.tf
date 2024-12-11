
/*
output "AKS_cluster_name" {
  description = "AKS cluster name"
  value       = data.azurerm_kubernetes_cluster.example.name
  sensitive = false
}

output "AKS_cluster_fqdn" {
  description = "AKS cluster FQDN"
  value       = data.azurerm_kubernetes_cluster.example.fqdn
  sensitive = false
}



output "AKS_cluster_list_names" {
  description = "AKS cluster list"
  value       = data.azapi_resource_list.listBySubscription.output.names
}

output "AKS_cluster_fqdn" {
  description = "AKS cluster fqdn"
  value       = data.azapi_resource_list.listBySubscription.output.api-server-fqdn
}
*/

output "AKS_cluster_ALL" {
  description = "AKS cluster ALL"
  value       = data.azapi_resource_list.listBySubscription.output
}

output "postgres_ALL" {
  description = "Azure postgres database ALL"
  value       = data.azapi_resource_list.postgresListBySubscription.output
}

output "mysql_ALL" {
  description = "Azure mysql database ALL"
  value       = data.azapi_resource_list.mysqlListBySubscription.output
}