autoscale_group_min_max = {
  max = 6
  min = 3
}
autoscale_group_size     = 3
environment              = "prod"
prefix                   = "tw"
vpc_address_range        = "10.2.0.0/16"
vpc_public_subnet_ranges = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24"]
instance_type            = "t3.small"
region                   = "us-west-2"