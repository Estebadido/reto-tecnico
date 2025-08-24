output "sg_bastion_host" {
  description = "Security Group ID"
  value       = [aws_security_group.SG_Bastion_Host.id]
  }
output "sg_private_instance" {
  description = "Security Group ID"
  value       = [aws_security_group.SG_Private_Instance.id]
  
}