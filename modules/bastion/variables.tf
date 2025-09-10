# modules/bastion/variables.tf

variable "cluster_name" {
  description = "The name of the EKS cluster for tagging."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to launch the bastion in."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of a public subnet to launch the bastion in."
  type        = string
}

variable "my_ip" {
  description = "Your local public IP address to allow for SSH."
  type        = string
}

variable "key_name" {
  description = "The name of the EC2 key pair for SSH access."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the bastion."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI ID for the bastion host (Amazon Linux 2)."
  type        = string
}