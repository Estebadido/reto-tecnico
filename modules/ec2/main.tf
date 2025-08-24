resource "aws_key_pair" "Key_Ec2" {
  key_name   = "Reto_Tecnico_Key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrrYMb1VAKpeRer+AhOzi68KuXF9gH7HxCtpIS6B3VjWobSTmWr5SmOoNI13lwPd3KdwbH10D44L/VyvdH+SpSiH8c7SCMF8Ydllw+GzKuICNx5BmSgCh28mx/crFoN/cKuzbeV70mLhwQ8s76+QyZ1WC4vEhUBH2bgYzH+iXE0hOONpsE8mfIUtIsqO+Kxq4vH6RKMiv/4o7WLs8YN6XGROeCHbuTouD/in+b9l1gxbYkEJtBO4V1Too+cGiEsG+B0ZRsJ9M5Bo2IBDXfkUfmaHtA2N8X5FXfXcTGd2b6WnLJ40qT7+0R2Si6Y4wpkAek/IU2ZWWP19w1zEedgQTN rsa-key-20250824"
   tags = merge(
    var.tags,
    {
      Name = "key-ec2-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
}
resource "aws_instance" "Bastion_Host" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  key_name = aws_key_pair.Key_Ec2.key_name
  iam_instance_profile = var.iam_instance_profile_name
  subnet_id = var.public_subnets_ids["${var.region}a"]
  private_ip    = "10.0.1.10"
  security_groups = var.sg_bastion_host



tags = merge(
    var.tags,
    {
      Name = "Bastion-Host-${var.tags["Project"]}"
    }
  )
}
resource "aws_eip_association" "bastion_eip_assoc" {
  instance_id   = aws_instance.Bastion_Host.id
  allocation_id = var.eip_id
}
resource "aws_instance" "Instancia_Privada" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  key_name = aws_key_pair.Key_Ec2.key_name
  subnet_id = var.private_subnets_ids["${var.region}b"]
  private_ip    = "10.0.4.10"
  security_groups = var.sg_private_instance


tags = merge(
    var.tags,
    {
      Name = "Instancia-Privada-${var.tags["Project"]}"
    }
  )
}