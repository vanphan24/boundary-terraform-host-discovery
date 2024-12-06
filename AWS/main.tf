# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


provider "aws" {
  region = var.aws_region
}

provider "boundary" {
  addr                   = var.boundary_addr
  auth_method_id         = var.boundary_auth_method_id
  auth_method_login_name = var.boundary_login_name
  auth_method_password   = var.boundary_password
}



### CREATE NEW BOUNDARY HOST CATALOG ###

resource "boundary_host_catalog_static" "rds" {
  name        = "My new host catalog"
  description = "My new host catalog via Terraform!"
  scope_id    = var.boundary_scope_id
}

### RETREIVE EXISTING AWS RDS DATABASES ###

# Retreive all RDS databases (in your region) that has tags where boundary=true.  
data "aws_db_instances" "database" {
  tags = {
    boundary = true
  }
} 

# Using Cole's suggestion which will iterate over aws_db_instance.database elements
data "aws_db_instance" "database" {
  for_each = toset(data.aws_db_instances.database.instance_identifiers)
  db_instance_identifier = each.key
}

### ADD RDS TO BOUNDARY HOST CATALOG ###

# Using similar logic as cole's suggestion of each.key for the database host name.
# Example "for-each" tutorial https://developer.hashicorp.com/terraform/tutorials/configuration-language/for-each
# Grabbed specific address (each.value.address)for each database in data.aws_db_instance.database
resource "boundary_host_static" "rds" {
  type            = "static"
  name            = each.key
  description     = " AWS RDS ${each.value.engine} added via TF. "
  address         = each.value.address
  host_catalog_id = boundary_host_catalog_static.rds.id
  for_each = data.aws_db_instance.database
}



### RETREIVE AWS EKS CLUSTERS ###

# Retrieving the list of EKS clusters. Unlike RDS, there's no tags on this data source, so you cannot specify which 
# EKS cluster to retreive. It will retrieve all EKS clusters.
data "aws_eks_clusters" "eks" {}

data "aws_eks_cluster" "eks" {
  for_each = toset(data.aws_eks_clusters.eks.names)
  name     = each.value
}


### ADD EKS CLUSTERS TO BOUNDARY HOST CATALOG ###
resource "boundary_host_static" "eks" {
  type            = "static"
  name            = each.key
  description     = " AWS EKS ${each.value.arn} added via TF. "
  address         = trim(each.value.endpoint, "https://")
  host_catalog_id = boundary_host_catalog_static.rds.id
  for_each = data.aws_eks_cluster.eks
}
