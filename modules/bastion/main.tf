# modules/bastion/main.tf

# The Bastion EC2 Instance
resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.cluster_name}-bastion-host"
  }
}

# Security group for the bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "${var.cluster_name}-bastion-sg"
  description = "Allow SSH inbound traffic to bastion host"
  vpc_id      = var.vpc_id

  # Allow SSH from your specific IP address
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
    description = "Allow SSH from my IP"
  }

  # Allow all outbound traffic from the bastion
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-bastion-sg"
  }
}

# Elastic IP for a fixed public address for the bastion
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
#   vpc      = true
  tags = {
    Name = "${var.cluster_name}-bastion-eip"
  }
}

