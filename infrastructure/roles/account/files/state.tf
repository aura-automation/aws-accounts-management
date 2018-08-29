terraform {
  backend "s3" {
    bucket = "account-remote-state"
    key    = "accounts/terraform"
    region = "us-east-1"
  }
}
