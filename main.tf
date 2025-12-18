# VPC Resources

data "aws_availability_zones" "available" {
  state = "available"
}

# NETWORKING #
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"

  name                    = "${var.prefix}-${var.environment}-vpc"
  cidr                    = var.vpc_address_range
  azs                     = slice(data.aws_availability_zones.available.names, 0, length(var.vpc_public_subnet_ranges))
  public_subnets          = var.vpc_public_subnet_ranges
  enable_nat_gateway      = false
  enable_vpn_gateway      = false
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true
}