output "id" {
  value = flatten([
    aws_vpc.prod_VPC.id,
    aws_subnet.prod_subnet[*].id,
    aws_internet_gateway.prod_IGW.id,
    aws_route_table.prod_RT.id,
    aws_route_table_association.prod_RT_ASSOCIATION[*],
    aws_security_group.PROD_sg.id,
    aws_vpc_security_group_ingress_rule.Prod_ingress[*].id,
  aws_vpc_security_group_egress_rule.Prod_egress.id])
}