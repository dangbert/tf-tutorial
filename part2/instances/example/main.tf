terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

module "website" {
    source = "../../modules/aws-s3-static-website-bucket"

    # add more fields below to properly instantiate this module (based on the module's variables.tf file):

}