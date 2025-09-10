variable "cluster_name" {
  description = "Cluster name used for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones. If empty, automatically detected."
  type        = list(string)
  default     = []
}
