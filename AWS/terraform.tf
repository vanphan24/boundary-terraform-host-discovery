# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  cloud {
    workspaces {
      name = "Boundary-discover-rds"
    }
  }

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
