# Databricks Terraform provider sample for AWS using private links (WIP)

This is the Terraform template to follow for an infrastructure based on private links.

Instead of following the standard Databricks Terraform template, which provisions a platform opened to the internet (i.e. using NAT gateways & internet gateways) like https://aws-quickstart.github.io/quickstart-databricks-unified-data-analytics-platform/#_technical_requirements (see my other repo https://github.com/pdemeulenaer/databricks-aws-terraform for a working template), this time we look for an implementation that is not opened to the internet and instead is using AWS's internal network, i.e. using AWS Private Links, as described in https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/aws-private-link-workspace.  


* TODO: in that link above, there is the list of required variables. Some of them point to components (like vpc_id, subnet_ids,...) that should *already* exist by the time of the terraform apply. That is a bit odd. Could we provision everything in one shot? We could start by manually creating them (or generating them using the Standard template) and just link them in the vars.tf. Then, second step would be to provision them too in one shot.

Commands to run:

terraform init
terraform plan -var-file="tutorial.tfvars"
terraform apply -var-file="tutorial.tfvars"
