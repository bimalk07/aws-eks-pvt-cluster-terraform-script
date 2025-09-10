# modules/bastion/outputs.tf

output "bastion_public_ip" {
  description = "The public IP address of the bastion host."
  value       = aws_eip.bastion_eip.public_ip
}

output "bastion_sg_id" {
  description = "The ID of the bastion host's security group."
  value       = aws_security_group.bastion_sg.id
}