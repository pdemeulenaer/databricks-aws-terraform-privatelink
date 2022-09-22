variable "databricks_account_id" {
  description = <<DESC
  The ID per Databricks AWS account used for accessing account management APIs. 
  After the AWS E2 account is created, this is available after logging into [https://accounts.cloud.databricks.com](https://accounts.cloud.databricks.com).
  DESC
}
variable "databricks_account_username" {
  description = "E2 account admin email address"
}
variable "databricks_account_password" {
  description = "E2 account admin password"
}
variable "region" {
  description = "region in which all AWS resources are deployed"
  default = "eu-central-1"
}

variable "workspace_vpce_service" {
  description = <<DESC
  VPC endpoint service for workspace communication. This is region-dependent. 
  For example, for us-east-1 the service is available on the Databricks Private Link [documentation](https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html#create-the-aws-vpc-endpoints-for-your-aws-region)
  `com.amazonaws.vpce.us-east-1.vpce-svc-09143d1e626de2f04`
  DESC
  default = "com.amazonaws.vpce.eu-central-1.vpce-svc-081f78503812597f7" # For Frankfurt region
}
variable "relay_vpce_service" {
  description = <<DESC
  VPC endpoint service for backend relays. This is region-dependent.
  For example, for us-east-1 the service is available on the Databricks Private Link [documentation](https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html#create-the-aws-vpc-endpoints-for-your-aws-region)
  `com.amazonaws.vpce.us-east-1.vpce-svc-09143d1e626de2f04`
  DESC
  default = "com.amazonaws.vpce.eu-central-1.vpce-svc-08e5dfca9572c85c4" # For Frankfurt region
}
variable "vpce_subnet_cidr" {
  description = "CIDR for deployment of the VPC endpoint subnets"
}

variable "private_dns_enabled" {
  default = true
}

variable "tags" { default = {} }

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC identifier for existing customer managed VPC"
}
variable "subnet_ids" {
  description = "private subnets associated with the Databricks-compliant VPC. This should be a list of strings"
  type        = list(string)
}
variable "security_group_id" {
  description = "security group ID used for VPC subnets"
}

variable "cross_account_arn" {
  description = "Existing cross-account IAM role ARN"
}

locals {
  prefix = "private-link-ws"
}






# variable "databricks_account_username" {}
# variable "databricks_account_password" {}
# variable "databricks_account_id" {}

# # new from Private Link template compared to Standard template
# variable "root_bucket_name" {}
# variable "cross_account_arn" {}
# variable "vpc_id" {}
# # variable "region" {}
# variable "security_group_id" {}
# variable "subnet_ids" { type = list(string) }
# variable "workspace_vpce_service" {}
# variable "relay_vpce_service" {}
# variable "vpce_subnet_cidr" {}
# variable "private_dns_enabled" { default = true } # TODO: true or false ???
# # variable "tags" { default = {} }

# locals {
#   prefix = "private-link-ws"
# }

# variable "tags" {
#   default = {}
# }

# # Do we need to define it explicitely here? TODO: find out if necessary
# variable "cidr_block" {
#   default = "10.4.0.0/16"
# }

# variable "region" {
#   default = "eu-central-1"
# }

# // See https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
# resource "random_string" "naming" {
#   special = false
#   upper   = false
#   length  = 6
# }

# locals {
#   prefix = "demo-${random_string.naming.result}"
# }