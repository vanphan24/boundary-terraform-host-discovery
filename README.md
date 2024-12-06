# boundary-terraform-target-discovery-aws
This repo will use Terraform to auto-discover RDS database instances and AWS Kubernetes Service (AKS) clusters in AWS and automatically add them to Boundary's host catalog

# Pre-reqs

This repo assumes you have: 
1. An existing Boundary cluster deployed.
2. Access and permissions to view AWS resouces, like RDS and AKS.
3. [Terraform installed](https://developer.hashicorp.com/terraform/install) locally on your machine. Terraform Cloud (HCP Terraform) is optional.

# Instructions:

1. Clone repo and navigate into the `boundary-terraform-host-discovery` folder.

```
git clone https://github.com/vanphan24/boundary-terraform-host-discovery.git
cd boundary-terraform-host-discovery
```

2. 
