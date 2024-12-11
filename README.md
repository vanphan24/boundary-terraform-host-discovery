# boundary-terraform-target-discovery-aws
This repo will use Terraform to auto-discover AWS and Azure resources and automatically add them your existing Boundar cluster's host catalog. Resources include:
- AWS RDS database instances. (RDS instances that are tagged will be discovered)
- AWS Elastic Kubernetes Service (EKS) clusters. 
- Azure postgres database servers.
- Azure mysql database servers.
- Azure AKS clusters.

You can add your additional resources to be discovered using the same data source from the [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) and the [Azapi provider](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_list). 
  

# Pre-reqs

This repo assumes you have: 
1. An existing Boundary cluster deployed.
2. Access and permissions to view AWS and Azure resouces, like RDS, EKS, AKS, etc.
3. [Terraform installed](https://developer.hashicorp.com/terraform/install) locally on your machine. Terraform Cloud (HCP Terraform) is optional.
4. [AWS CLI installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) if you want to discover AWS resources.
5. [Azure CLI installed](https://learn.microsoft.com/en-us/cli/azure/) if you want to discover Azure resources.

# Instructions for AWS resources:

1. Go to your AWS RDS instances and add a tag to any RDS instance you wish to be discovered by Boundary.  
   The tag name should be `boundary` and the value should be `true`  
   Terraform will search RDS and will only add RDS instances with matching tags. For EKS instances, terraform will added all EKS clusters since the [aws_eks_clusters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_clusters) data source provider does not have a tag field to filter based on tags.
![image](https://github.com/vanphan24/boundary-terraform-host-discovery/blob/main/images/2024-12-06_12-16-59.png)

2. On your local machine terminal, set environment variable to access your AWS account.

```
export AWS_ACCESS_KEY_ID= <your-aws-access-id>
export AWS_SECRET_ACCESS_KEY= <your-aws-secret-access-key>
export AWS_SESSION_TOKEN= <your-session-token-if-applicable>
```  

3. On your local machine terminal, clone repo and navigate into the `boundary-terraform-host-discovery` folder.

```
git clone https://github.com/vanphan24/boundary-terraform-host-discovery.git
cd boundary-terraform-host-discovery/AWS
```

4. Update the `variable.tf` file with the settings that match your environment. 

5. Run terraform init.

```
terraform init
```


6. Run terraform plan.

```
terraform plan
```

7. Run terraform apply.

```
terraform apply --auto-approve 
```


8. After terraform completes, your new Boundary host catalog, RDS instances and/or EKS clusters will be added as hosts in Boundary.
![image](https://github.com/vanphan24/boundary-terraform-host-discovery/blob/main/images/2024-12-06_14-16-07.png)

### Clean-up

9. Remove host catalog and RDS/EKS resources from Boundary.

   ```
   terraform destroy --auto-apply
   ```



            
# Instructions for Azure resources:

1. Log onto Azure from your local machine terminal.

```
az login --tenant <your-tenant-id>
```
   
2. On your local machine terminal, clone repo and navigate into the `boundary-terraform-host-discovery` folder.

```
git clone https://github.com/vanphan24/boundary-terraform-host-discovery.git
cd boundary-terraform-host-discovery/Azure
```

3. Update the `variable.tf` file with the settings that match your environment. 

4. Run terraform init.

```
terraform init
```


5. Run terraform plan.

```
terraform plan
```

6. Run terraform apply.

```
terraform apply --auto-approve 
```


7. After terraform completes, your new Boundary host catalog, RDS instances and/or EKS clusters will be added as hosts in Boundary.
![image](https://github.com/vanphan24/boundary-terraform-host-discovery/blob/main/images/2024-12-11_15-37-32.png)

### Clean-up

8. Remove host catalog and RDS/EKS resources from Boundary.

   ```
   terraform destroy --auto-apply
   ```
