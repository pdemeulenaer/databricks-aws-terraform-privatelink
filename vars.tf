variable "databricks_account_username" {}
variable "databricks_account_password" {}
variable "databricks_account_id" {}

# new from Private Link template compared to Standard template
variable "root_bucket_name" {}
variable "cross_account_arn" {}
variable "vpc_id" {}
# variable "region" {}
variable "security_group_id" {}
variable "subnet_ids" { type = list(string) }
variable "workspace_vpce_service" {}
variable "relay_vpce_service" {}
variable "vpce_subnet_cidr" {}
variable "private_dns_enabled" { default = false }
# variable "tags" { default = {} }

locals {
  prefix = "private-link-ws"
}

variable "tags" {
  default = {}
}

# Do we need to define it explicitely here? TODO: find out if necessary
variable "cidr_block" {
  default = "10.4.0.0/16"
}

variable "region" {
  default = "eu-central-1"
}

# // See https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
# resource "random_string" "naming" {
#   special = false
#   upper   = false
#   length  = 6
# }

# locals {
#   prefix = "demo-${random_string.naming.result}"
# }