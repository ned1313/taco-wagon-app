provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner       = "taco-wagon-team"
      Environment = var.environment
    }
  }
}