variable "cluster_name" {
  description = "Cluster name used for tagging"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the endpoints will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for interface endpoints"
  type        = list(string)
}

variable "route_table_ids" {
  description = "List of route table IDs for the S3 gateway endpoint"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPC CIDR block for restricting endpoint SG ingress"
  type        = string
}
