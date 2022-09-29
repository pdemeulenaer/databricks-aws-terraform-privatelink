# Databricks Terraform provider sample for AWS using private links (WIP)

This is the Terraform template to follow for an infrastructure based on private links.

Instead of following the standard Databricks Terraform template, which provisions a platform opened to the internet (i.e. using NAT gateways & internet gateways) like https://aws-quickstart.github.io/quickstart-databricks-unified-data-analytics-platform/#_technical_requirements (see my other repo https://github.com/pdemeulenaer/databricks-aws-terraform for a working template), this time we look for an implementation that is not opened to the internet and instead is using AWS's internal network, i.e. using AWS Private Links, as described in https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/aws-private-link-workspace.  

This repo will closely follow https://github.com/databricks/terraform-databricks-lakehouse-blueprints/tree/main/examples/test_aws_customer_managed_vpc and therein. 

## Prerequisites

- An existing Databricks account, specifically for the AWS cloud: [see here to register such account](https://docs.databricks.com/getting-started/account-setup.html)

- An existing VPC within your AWS account. To create and configure it properly, [see here](https://docs.databricks.com/administration-guide/cloud-configurations/aws/customer-managed-vpc.html)

- An existing cross-account IAM rule: a cross account IAM role allows the Databricks "Control Plane" (located in a Databricks AWS account) to create spark clusters within your "Data Plane", i.e. within your managed VPC. [See here on how to create such a rule from the console](https://docs.databricks.com/administration-guide/account-api/iam-role.html#create-a-cross-account-role)

## Inputs

The inputs are to be defined in a file.tfvars as some are secrets

- databricks_account_username

- databricks_account_password

- databricks_account_id

- cross_account_arn

- vpce_subnet_cidr

- vpc_id

- subnet_ids = ["private-subnet-1-id", "private-subnet-2-id"] (should be in such list format)

- security_group_id

## Outputs

## task list

* TODO: in the Terraform link above, there is the list of required variables. Some of them point to components (like vpc_id, subnet_ids,...) that should *already* exist by the time of the terraform apply. That is a bit odd. Could we provision everything in one shot? We could start by manually creating them (or generating them using the Standard template) and just link them in the vars.tf. Then, second step would be to provision them too in one shot.

* TODO: add tags

* figure out how the frontend VPC endpoint is created. Only the backend VPC endpoint are explicitely defined here

## Commands to run

terraform init
terraform plan -var-file="tutorial.tfvars"
terraform apply -var-file="tutorial.tfvars"
