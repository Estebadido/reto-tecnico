resource "aws_vpc" "VPC_Reto" {
  cidr_block = "10.0.0.0/16"
  tags = merge(
    var.tags,
    {
      Name        = "vpc-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
}
resource "aws_subnet" "Subnets_Public" {
  for_each = local.public_subnet_cidrs
  vpc_id            = aws_vpc.VPC_Reto.id
  cidr_block        = each.value
  availability_zone = "${each.key}" 
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Project"]}-subnet-public-${each.key}-${var.tags["Environment"]}"
    }
  )
  
}
resource "aws_subnet" "Subnets_Private" {
  for_each = local.private_subnet_cidrs
  vpc_id            = aws_vpc.VPC_Reto.id
  cidr_block        = each.value
  availability_zone = "${each.key}" 
  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Project"]}-subnet-private-${each.key}-${var.tags["Environment"]}"
    }
  )
}
resource "aws_internet_gateway" "IGW_Reto" {
  vpc_id = aws_vpc.VPC_Reto.id
  tags = merge(
    var.tags,
    {
      Name = "igw-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
  
}

resource "aws_eip" "EIP_Reto" {
  domain   = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "eip-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
}

resource "aws_nat_gateway" "NAT_GW_Reto" {
  allocation_id = aws_eip.EIP_Reto.id
  subnet_id     = aws_subnet.Subnets_Public["${var.region}a"].id
tags = merge(
    var.tags,
    {
      Name = "nat_gw-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
  depends_on = [aws_internet_gateway.IGW_Reto]
}

resource "aws_route_table" "Route_Table_Public" {
  vpc_id = aws_vpc.VPC_Reto.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_Reto.id
  }
tags = merge(
    var.tags,
    {
      Name = "route_table-public-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
}
resource "aws_route_table" "Route_Table_Private" {
  vpc_id = aws_vpc.VPC_Reto.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_GW_Reto.id
  }
tags = merge(
    var.tags,
    {
      Name = "route_table-private-${var.tags["Project"]}-${var.tags["Environment"]}"
    }
  )
}
resource "aws_route_table_association" "Association_Route_Table_Public" {
  for_each = aws_subnet.Subnets_Public
  subnet_id      = aws_subnet.Subnets_Public[each.key].id
  route_table_id = aws_route_table.Route_Table_Public.id
}
resource "aws_route_table_association" "Association_Route_Table_Private" {
  for_each = aws_subnet.Subnets_Private
  subnet_id      = aws_subnet.Subnets_Private[each.key].id
  route_table_id = aws_route_table.Route_Table_Private.id
}