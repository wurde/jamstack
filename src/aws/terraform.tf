terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.69"
      region  = "us-east-1"
    }
  }

  required_version = ">= 0.13"
}
