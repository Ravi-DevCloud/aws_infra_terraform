terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "aws-infra-terraform-iac"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
  }
}