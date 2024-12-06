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
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.76.0"
    }

    boundary = {
      source  = "hashicorp/boundary"
    }

  }

  required_version = "~> 1.2"
}
