# Creating VPC
resource "aws_vpc" "prod_VPC" {
  cidr_block = var.submit.vpccidr
  tags = {
    Name = var.submit.vpcname
  }
}
# Creating 2 Subnets
# One is Provisional and another one is Docker
resource "aws_subnet" "prod_subnet" {
  vpc_id = aws_vpc.prod_VPC.id
  count  = local.subnet_level
  # count = length(var.submit.subnetsvalues.subcidr[count.index]) ❌
  # Explanation: count takes just the length value. You don't use count.index inside the length() function

  cidr_block        = var.submit.subnetsvalues.subcidr[count.index]
  availability_zone = var.submit.subnetsvalues.subaz[count.index]
  tags = {
    Name = var.submit.subnetsvalues.subtags[count.index]
  }
  depends_on = [aws_vpc.prod_VPC]
}
# Now Creating the internet gateway for allowing ec2
resource "aws_internet_gateway" "prod_IGW" {
  vpc_id = aws_vpc.prod_VPC.id
  tags = {
    Name = var.submit.gateway.igwname
  }
  depends_on = [aws_vpc.prod_VPC]
}
# assign traffic to ec2 instance for creating the route table 
resource "aws_route_table" "prod_RT" {
  vpc_id = aws_vpc.prod_VPC.id
  route {
    cidr_block = var.submit.route_config.routecidr
    gateway_id = aws_internet_gateway.prod_IGW.id
  }
  tags = {
    Name = var.submit.route_config.routetag
  }
  depends_on = [aws_vpc.prod_VPC, aws_internet_gateway.prod_IGW]
}
#      to peer subnet and toute table id one subnet id is provisionary
#     
#         
#    
#         
#         depends_on          = [ aws_route_table.prod_RT, aws_subnet.prod_subnet ]
# }
#        to peer subnet and toute table id second subnet id is docker
#         resource "aws_route_table_association" "prod_RT_ASSOCIATION_2" {
#         count               = local.subnet_level
#         subnet_id           = aws_subnet.prod_subnet[1].id
#         route_table_id      = aws_route_table.prod_RT.id
#         depends_on          = [ aws_route_table.prod_RT, aws_subnet.prod_subnet ]
# }
resource "aws_route_table_association" "prod_RT_ASSOCIATION" {
  count          = local.subnet_level
  subnet_id      = aws_subnet.prod_subnet[count.index].id
  route_table_id = aws_route_table.prod_RT.id
  depends_on     = [aws_route_table.prod_RT, aws_subnet.prod_subnet]
}


# traffic rules for how to connect ec2 and whom to connect ec2
resource "aws_security_group" "PROD_sg" {
  name        = var.submit.security_config.sgname
  vpc_id      = aws_vpc.prod_VPC.id
  description = var.submit.security_config.sgdesc
}
# it's connect to ec2 aks inbound rule in terraform called as a ingress 
resource "aws_vpc_security_group_ingress_rule" "Prod_ingress" {
  count             = local.sg_level
  security_group_id = aws_security_group.PROD_sg.id
  description       = var.submit.ingress_config.ingdesc[count.index]
  from_port         = var.submit.ingress_config.ifromport[count.index]
  to_port           = var.submit.ingress_config.itoport[count.index]
  ip_protocol       = var.submit.ingress_config.ippr[count.index]
  cidr_ipv4         = var.submit.ingress_config.icidr[count.index]
  tags = {
    Name = var.submit.ingress_config.itag[count.index]
  }
}
# in ec2 how internet connect in that time creating outbound rule in terraform called as a egree 
resource "aws_vpc_security_group_egress_rule" "Prod_egress" {
  security_group_id = aws_security_group.PROD_sg.id
  description       = var.submit.egress_config.engdesc
#   from_port         = var.submit.egress_config.efromport
#   to_port           = var.submit.egress_config.etoport
  ip_protocol       = var.submit.egress_config.eippr
  cidr_ipv4         = var.submit.egress_config.ecidr
  tags = {
    Name = var.submit.egress_config.etag
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.submit.s3bucket.bucketname
  tags = {
    Name = var.submit.s3bucket.tagname
  }
}
