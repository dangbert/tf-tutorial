terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  profile = "dangbert"
  region  = "us-east-2"
}

module "website" {
  source = "../../modules/aws-s3-static-website-bucket"

  # add more fields below to properly instantiate this module (based on the module's variables.tf file):

  # make this something unique to your AWS account:
  bucket_name = "tf-tutorial-bucket"

  # example tags, set to whatever you want or omit:
  tags = {
    "Terraform" = "true"
    "ENV"       = "DEV"
  }
}