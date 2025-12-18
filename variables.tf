variable "environment" {
  type        = string
  description = "(Required) Environment of all resources"
}

variable "prefix" {
  type        = string
  description = "(Required) Prefix to use for all resources in this module."
}

variable "region" {
  type        = string
  description = "(Optional) AWS Region to deploy in. Defaults to us-east-1."
  default     = "us-west-2"
}

variable "vpc_address_range" {
  type        = string
  description = "Address range for the VPC"
}

variable "vpc_public_subnet_ranges" {
  type        = list(string)
  description = "List of public subnet CIDR ranges for the VPC"
}

