output "s3_endpoint_id" {
  description = "ID of the S3 Gateway VPC Endpoint"
  value       = aws_vpc_endpoint.s3.id
}

output "interface_endpoints_ids" {
  description = "IDs of the created Interface VPC Endpoints"
  value       = { for k, ep in aws_vpc_endpoint.interface_endpoints : k => ep.id }
}

output "endpoints_sg_id" {
  description = "Security group ID used by the VPC interface endpoints"
  value       = aws_security_group.endpoints_sg.id
}
