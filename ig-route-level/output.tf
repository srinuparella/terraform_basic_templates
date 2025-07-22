output "myvpc_id" {
value = aws_vpc.mainvpc.id
}
output "publicsubnets_id" {
 value = aws_subnet.mainsubnet[*].id
}
output "igwid" {
  value = aws_internet_gateway.igw.id
}
output "routeid" {
  value=aws_route_table.pubroute.id
}

