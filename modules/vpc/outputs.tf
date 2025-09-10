output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [for s in aws_subnet.private : s.id]
}

output "nat_gateway_id" {
  description = "The NAT Gateway ID"
  value       = aws_nat_gateway.nat.id
}

output "igw_id" {
  description = "The Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}
