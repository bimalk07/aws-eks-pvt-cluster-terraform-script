variable "cluster_name" {
  description = "Cluster name used for tagging"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block (for control plane access rule)"
  type        = string
}
