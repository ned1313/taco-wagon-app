autoscale_group_min_max = {
  max = 3
  min = 1
}
autoscale_group_size     = 2
environment              = "dev"
prefix                   = "tw"
vpc_address_range        = "10.0.0.0/16"
vpc_public_subnet_ranges = ["10.0.0.0/24", "10.0.1.0/24"]
instance_type            = "t3.micro"
region                   = "us-west-2"