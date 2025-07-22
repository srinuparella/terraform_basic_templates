        # vpc level
        resource "aws_vpc" "mainvpc" {
        cidr_block = var.vpc_subnets_assign.var_vpc
        tags = {
            Name = var.vpc_subnets_assign.var_vpc_cidr
        }

        }
        #subnet level
        resource "aws_subnet" "mainsubnet" {
        count = local.count_level
        vpc_id = aws_vpc.mainvpc.id
        cidr_block = var.vpc_subnets_assign.publicsubnets.subcidr[count.index]
        availability_zone = var.vpc_subnets_assign.publicsubnets.subaz[count.index]
        tags = {
        Name = var.vpc_subnets_assign.publicsubnets.subtags[count.index]
        }
        depends_on = [ aws_vpc.mainvpc ]
        }
        resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.mainvpc.id
        tags ={
            Name = "myigw"
        }
        depends_on = [ aws_vpc.mainvpc ]
        }
       # route_table 
        resource "aws_route_table" "pubroute" {
        vpc_id = aws_vpc.mainvpc.id
        route  {
        cidr_block = "0.0.0.0/0"
        gateway_id=aws_internet_gateway.igw.id
            }  
            tags ={
        Name="myroutetable"
            }
        depends_on = [ aws_vpc.mainvpc,aws_internet_gateway.igw ]
        }


## Route Table association

        resource "aws_route_table_association" "association" {
        count = local.count_level
        subnet_id = aws_subnet.mainsubnet[count.index].id
        route_table_id = aws_route_table.pubroute.id
        depends_on = [aws_route_table.pubroute,aws_subnet.mainsubnet]
        }