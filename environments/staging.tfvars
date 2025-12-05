autoscale_group_min_max = {
  max = 3
  min = 1
}
autoscale_group_size     = 2
environment              = "staging"
prefix                   = "tw"
vpc_address_range        = "10.1.0.0/16"
vpc_public_subnet_ranges = ["10.1.0.0/24", "10.1.1.0/24"]
instance_type            = "t3.small"
region                   = "us-west-2"