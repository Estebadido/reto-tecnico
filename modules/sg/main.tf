resource "aws_security_group" "SG_Bastion_Host" {
  vpc_id = var.vpc_id
  name   = "sg_bastion-${var.tags["Project"]}-${var.tags["Environment"]}"

  tags = merge(
    var.tags,
    { Name = "sg_bastion-${var.tags["Project"]}-${var.tags["Environment"]}" }
  )
}

resource "aws_security_group_rule" "SSH_Publico" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_Bastion_Host.id
}

resource "aws_security_group_rule" "HTTP_Publico" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_Bastion_Host.id
}

resource "aws_security_group_rule" "HTTPS_Publico" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_Bastion_Host.id
}
resource "aws_security_group_rule" "Egress_All_Publico" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_Bastion_Host.id
}

resource "aws_security_group" "SG_Private_Instance" {
  vpc_id = var.vpc_id
  name   = "sg_private-${var.tags["Project"]}-${var.tags["Environment"]}"

  tags = merge(
    var.tags,
    { Name = "sg_private-${var.tags["Project"]}-${var.tags["Environment"]}" }
  )
}

resource "aws_security_group_rule" "SSH_Privado" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.1.10/32"]
  security_group_id = aws_security_group.SG_Private_Instance.id
}

# resource "aws_security_group_rule" "HTTP_Privado" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["10.0.1.10/32"]
#   security_group_id = aws_security_group.SG_Private_Instance.id
# }

# resource "aws_security_group_rule" "HTTPS_Privado" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["10.0.1.10/32"]
#   security_group_id = aws_security_group.SG_Private_Instance.id
# }
resource "aws_security_group_rule" "Egress_All_Privado" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_Private_Instance.id
}

