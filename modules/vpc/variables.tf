variable "cluster_name" {
  description = "A name prefix used for tagging and naming VPC resources."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "A list of Availability Zones to use for the subnets. If empty, the module will auto-select zones."
  type        = list(string)
  default     = []
}

variable "public_subnets_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
}

variable "public_route_cidr" {
  description = "The destination CIDR block for the public route table's route to the Internet Gateway (e.g., '0.0.0.0/0')."
  type        = string
}

variable "private_route_cidr" {
  description = "The destination CIDR block for the private route table's route to the NAT Gateway (e.g., '0.0.0.0/0')."
  type        = string
}