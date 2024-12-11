# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  /*  Remove comment if using HCP Terraform 
  cloud {
    workspaces {
      name = "Boundary-discover-hosts"
    }
  }
  */

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.13.0"
    }

    boundary = {
      source  = "hashicorp/boundary"
    }
 
    azapi = {
      source = "Azure/azapi"
    }
  

  }

  required_version = "~> 1.2"
}
