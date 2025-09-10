variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster and node groups"
  type        = list(string)
}

variable "iam_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS worker node group"
  type        = string
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the EKS node group"
  type        = list(string)
  default     = ["t2.medium"]
}

variable "node_group_desired" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}
