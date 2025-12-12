provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner   = "Ned"
      Project = "Taco Wagon A"
    }
  }
}