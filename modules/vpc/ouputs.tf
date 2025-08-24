output "vpc_id" {
  description = "El ID de la VPC creada"
  value       = aws_vpc.VPC_Reto.id
  
}
output "public_subnets_ids" {
    description = "El ID de la subnet publica"
  value = { for zona_disp, subnet in aws_subnet.Subnets_Public : zona_disp => subnet.id }
}

output "private_subnets_ids" {
    description = "El ID de la subnet privada"
  value = { for zona_disp, subnet in aws_subnet.Subnets_Private : zona_disp => subnet.id }
}
output "eip_id" {
  description = "El ID de la Elastic IP"
  value       = aws_eip.EIP_Reto.id
  
}