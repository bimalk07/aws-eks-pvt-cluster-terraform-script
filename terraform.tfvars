# General
aws_region   = "eu-west-3"
environment  = "dev"
cluster_name = "private-eks-cluster-bimal"

# Networking
vpc_cidr             = "10.10.0.0/16"
public_subnets_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]

# AZs (optional - Terraform can auto-detect if empty)
availability_zones = ["eu-west-3a", "eu-west-3b"]

# Node Group
node_group_instance_types = ["t3.medium"]
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3

# Cluster version
cluster_version = "1.28"

# IAM (optional)
enable_ssm = true
tags = {
  Environment = "dev"
}
