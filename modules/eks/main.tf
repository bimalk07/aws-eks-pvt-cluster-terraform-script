# Create EKS cluster (private endpoint only)
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = var.iam_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false
    # You can provide cluster_security_group_id to control access; leaving default and will reference later
    public_access_cidrs = [] # empty since public access disabled
  }

  # OIDC provider (used later by addons / IRSA if needed)
  enabled_cluster_log_types = ["api", "audit", "authenticator"]
  tags                      = { Name = var.cluster_name }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy
  ]
}

# Generate kubeconfig file for convenience (this file will contain a private endpoint that is not reachable from internet
# unless you are within the VPC or via VPN / bastion). You can use this kubeconfig on a machine that has network access to the cluster.
resource "local_file" "kubeconfig" {
  content = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name     = aws_eks_cluster.this.name
    cluster_endpoint = aws_eks_cluster.this.endpoint
    ca_data          = aws_eks_cluster.this.certificate_authority[0].data
    region           = var.aws_region
  })
  filename   = "${path.module}/kubeconfig-${var.cluster_name}.yaml"
  depends_on = [aws_eks_cluster.this]
}


# Wait for cluster to be active before creating node group
resource "aws_eks_node_group" "managed_nodes" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = var.node_group_desired
    min_size     = var.node_group_min
    max_size     = var.node_group_max
  }

  # Use Amazon Linux 2 AMI managed by EKS
  ami_type       = "AL2_x86_64"
  instance_types = var.node_group_instance_types

  remote_access {
    # No bastion / no public key — nodes are private; remove if you want SSH via bastion
    # If you want SSH access, set key_name and ensure bastion or SSM
    ec2_ssh_key = ""
  }

  tags = {
    Name = "${var.cluster_name}-managed-node"
  }

  depends_on = [
    aws_eks_cluster.this
  ]
}

# Data source to output cluster endpoint/private access details
output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS cluster endpoint (should be private)"
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "node_group_arn" {
  value = aws_eks_node_group.managed_nodes.arn
}
