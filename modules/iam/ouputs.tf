output "ec2_instance_profile_name" {
  description = "Nombre del Instance Profile para asociar a la EC2"
  value       = aws_iam_instance_profile.ec2_ssm_profile.name
}

