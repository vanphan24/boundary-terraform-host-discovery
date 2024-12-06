# boundary-terraform-target-discovery-aws
This repo will use Terraform to auto-discover RDS database instances and AWS Kubernetes Service (AKS) clusters in AWS and automatically add them to Boundary's host catalog

# Pre-reqs

This repo assumes you have: 
1. An existing Boundary cluster deployed.
2. Access and permissions to view AWS resouces, like RDS and AKS.
3. [Terraform installed](https://developer.hashicorp.com/terraform/install) locally on your machine. Terraform Cloud (HCP Terraform) is optional.

# Instructions:

1. Go to your AWS RDS instances and add a tag to any RDS instance you wish to be discovered by Boundary.  
   The tag name should be `boundary` and the value should be `true`
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
Optionally, apply username and password on command line:

```
terraform apply -var boundary_login_name=<YOUR LOGIN> -var boundary_password=<YOUR PASSWORD> -auto-approve 
```

5. 
