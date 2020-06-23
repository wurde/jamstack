# Configure Terraform.
# https://terraform.io/docs/configuration/terraform.html

terraform {
  required_version = "~> 0.12"

  required_providers {
    aws = "~> 2.0"
  }
}
