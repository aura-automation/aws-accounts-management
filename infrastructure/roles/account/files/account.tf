provider "aws" {
    version =  "~>1.33"
    region = "${var.region}"
}

# resource "aws_organizations_account" "account_1" {
#   name  = "my_new_account_1"
#   email = "bhadrajatin+1@gmail.com"
#   iam_user_access_to_billing = "ALLOW"
#   role_name = "temp_serviceadmin"
# }

resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "bar"
}