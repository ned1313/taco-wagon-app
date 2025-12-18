terraform {
  required_version = ">=1.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }

  backend "s3" {
    # Use contents from backends/*.hcl files
  }
}