variable "cluster_name" {
  type        = string
  description = "EKS cluster name (used for naming IAM roles)"
}

variable "enable_ssm" {
  type        = bool
  default     = false
  description = "Attach AmazonSSMManagedInstanceCore to worker nodes for debugging"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for IAM resources"
}
