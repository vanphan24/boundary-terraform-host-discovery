# boundary-terraform-target-discovery-aws
This repo will use Terraform to auto-discover RDS database instances and Elastic Kubernetes Service (EKS) clusters in AWS and automatically add them to Boundary's host catalog

# Pre-reqs

This repo assumes you have: 
1. An existing Boundary cluster deployed.
2. Access and permissions to view AWS resouces, like RDS and AKS.
3. [Terraform installed](https://developer.hashicorp.com/terraform/install) locally on your machine. Terraform Cloud (HCP Terraform) is optional.

# Instructions:

1. Go to your AWS RDS instances and add a tag to any RDS instance you wish to be discovered by Boundary.  
   The tag name should be `boundary` and the value should be `true`  
   Terraform will search RDS and will only add RDS instances with matching tags. For EKS instance, terraform will added all EKS clusters since the [aws_eks_clusters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_clusters) data source provider does not have an tag filed to filter based on tags.
![image](https://github.com/vanphan24/boundary-terraform-host-discovery/blob/main/images/2024-12-06_12-16-59.png)



1. Clone repo and navigate into the `boundary-terraform-host-discovery` folder.

```
git clone https://github.com/vanphan24/boundary-terraform-host-discovery.git
cd boundary-terraform-host-discovery
```

2. Update the variable.tf file with the settings that match your environment. 

2. Run terraform init.

```
terraform init
```


3. Run terraform plan.

```
terraform plan
```

4. Run terraform apply.

```
terraform apply --auto-approve 
```


5. 
