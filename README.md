# Databricks Terraform provider sample for AWS using private links (WIP)

This is the Terraform template to follow for an infrastructure based on private links.

Instead of following the standard Databricks Terraform template, which provisions a platform opened to the internet (i.e. using NAT gateways & internet gateways) like https://aws-quickstart.github.io/quickstart-databricks-unified-data-analytics-platform/#_technical_requirements (see my other repo https://github.com/pdemeulenaer/databricks-aws-terraform for a working template), this time we look for an implementation that is not opened to the internet and instead is using AWS's internal network, i.e. using AWS Private Links, as described in https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/aws-private-link-workspace.  


Commands to run:

terraform init
terraform plan -var-file="tutorial.tfvars"
terraform apply -var-file="tutorial.tfvars"
