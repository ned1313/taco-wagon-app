<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 6.4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment of all resources | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) Prefix to use for all resources in this module. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) AWS Region to deploy in. Defaults to us-east-1. | `string` | `"us-west-2"` | no |
| <a name="input_vpc_address_range"></a> [vpc\_address\_range](#input\_vpc\_address\_range) | Address range for the VPC | `string` | n/a | yes |
| <a name="input_vpc_public_subnet_ranges"></a> [vpc\_public\_subnet\_ranges](#input\_vpc\_public\_subnet\_ranges) | List of public subnet CIDR ranges for the VPC | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_TF_DOCS -->