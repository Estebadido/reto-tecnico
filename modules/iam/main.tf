resource "aws_iam_role" "EC2_Rol" {
    name= "EC2_Rol"
tags = var.tags


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "Atacha_Rol_EC2" {
  role       = aws_iam_role.EC2_Rol.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_role_policy_attachment" "Atacha_Rol_S3" {
  role       = aws_iam_role.EC2_Rol.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "Atacha_Rol_CloudWatch" {
  role       = aws_iam_role.EC2_Rol.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}
resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "EC2_Rol_Full_Access"
  role = aws_iam_role.EC2_Rol.name
}