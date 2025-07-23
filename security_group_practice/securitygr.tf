## first we need some arguments are there to creating security group
# 1.sg igw_name
# 2.vpc in
# 3.description
# 4.inbounding --->aka INGRESS
# 5.outbounding --->aka EGRESS
# 6.Inside of above in and out bound rules has some options there like 
# 7.cidr_block
# 8.ip protocol
# 9.port number

## outside of terraform using this also more than one vpc use this
# data "aws_vpc" "existing" {
#   filter {
#     name   = "tag:Name"
#     values = ["dummyvpc"]
#   }
# }

# otherwise only default value using below this way
# data "aws_vpc" "fetched_default_vpc"{
#     default = true
# }
# so now our vpc in main.tf within terraform we are create aws_security_group so we can call vpc directly
resource "aws_security_group" "mysg1" {
  name   = var.lengthcount.sgvariables.sgname
  vpc_id = aws_vpc.myvpc.id
  description =var.lengthcount.sgvariables.sgdescri
  tags = {
    Name =var.lengthcount.sgvariables.sgtagname
  }
}
# resource "aws_vpc_security_group_ingress_rule" "ingress1" {
#     security_group_id = aws_security_group.mysg1.id
#     description = "Allow SSH"
#     from_port = 22
#     to_port = 22
#     ip_protocol = "TCP"   # two types of protocols 1.TCP 2.UDP
#     cidr_ipv4 = var.lengthcount.route_table_tag.routecidr
#     tags = {
#       Name ="Firsst Ingress Rule"
#     }
# }

# resource "aws_vpc_security_group_ingress_rule" "ingress2" {
#     security_group_id = aws_security_group.mysg1.id
#     description = "Allow HTTPS"
#     from_port = 443
#     to_port = 443
#     ip_protocol = "TCP"
#     cidr_ipv4 = var.lengthcount.route_table_tag.routecidr
#     tags = {
#       Name = "Second Ingress Rule"
#     }
# }


resource "aws_vpc_security_group_ingress_rule" "ingress1" {
  count             = length(var.lengthcount.sgingress.infrmport)
  security_group_id = aws_security_group.mysg1.id
  description       = var.lengthcount.sgingress.indescr[count.index]
  from_port         = var.lengthcount.sgingress.infrmport[count.index]
  to_port           = var.lengthcount.sgingress.intoport[count.index]
  ip_protocol       = var.lengthcount.sgingress.inipproto[count.index]
  cidr_ipv4         = var.lengthcount.sgingress.cidr_ipv4[count.index]

  tags = {
    Name = var.lengthcount.sgingress.intagname[count.index]
  }
}












# resource "aws_vpc_security_group_ingress_rule" "ingress1" {
#     count = length(var.lengthcount.sgingress)
#     security_group_id = aws_security_group.mysg1.id
#     description = var.lengthcount.sgingress.indescr[count.index]
#     from_port = var.lengthcount.sgingress.infrmport[count.index]
#     to_port = var.lengthcount.sgingress.intoport[count.index]
#     ip_protocol = var.lengthcount.sgingress.inipproto[count.index]   # two types of protocols 1.TCP 2.UDP
#     cidr_ipv4 = var.lengthcount.route_table_tag.routecidr
#     tags = {
#       Name = var.lengthcount.sgingress.intagname[count.index]
#     }
# }


resource "aws_vpc_security_group_egress_rule" "egree" {
  security_group_id = aws_security_group.mysg1.id
  description = "Allow all traffic"
  from_port = 0
  to_port = 0
  ip_protocol = "-1" # semantically equivalent to all ports
  cidr_ipv4 = var.lengthcount.route_table_tag.routecidr
  tags = {
    Name = "Egree Rule"
  }
}
