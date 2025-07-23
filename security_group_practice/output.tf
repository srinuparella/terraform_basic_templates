output "allids" {
  value = flatten([
           [aws_vpc.myvpc.id,
           aws_subnet.mysubnet[*].id,
           aws_internet_gateway.igw.id,
           aws_route_table.routetable.id,
           aws_security_group.mysg1.id]
           ])
}