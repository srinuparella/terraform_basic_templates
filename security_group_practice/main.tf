resource "aws_vpc" "myvpc" {
    cidr_block = var.lengthcount.vpccidr
    tags = {
      Name = var.lengthcount.vpcname
    }
}

## Creating Subnets and Assigned VPC
## Also using count and length

resource "aws_subnet" "mysubnet" {
  count             = local.count_level
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.lengthcount.public_private_subnets.subcidr[count.index]
  availability_zone = var.lengthcount.public_private_subnets.subaz[count.index]
  tags              = {
  Name              = var.lengthcount.public_private_subnets.subname[count.index]
  
  }
  depends_on = [ aws_vpc.myvpc ]
}

## Now creating Internet Gate Way

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = var.lengthcount.igw_tag.igw_name
    }
  depends_on = [ aws_vpc.myvpc ]
}

## Creating route table
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = var.lengthcount.route_table_tag.routecidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.lengthcount.route_table_tag.routename
  }
  depends_on = [ aws_vpc.myvpc,aws_internet_gateway.igw ]
}

##  Now create route associastion , assign only public subnets
resource "aws_route_table_association" "associastion" {
  count = local.count_level
  subnet_id = aws_subnet.mysubnet[0].id
  route_table_id = aws_route_table.routetable.id
  depends_on = [ aws_route_table.routetable,aws_subnet.mysubnet ]
}
## Now assign the second public ip 
resource "aws_route_table_association" "associastion1" {
  count = local.count_level
  subnet_id = aws_subnet.mysubnet[1].id
  route_table_id = aws_route_table.routetable.id
  depends_on = [ aws_route_table.routetable,aws_subnet.mysubnet ]
}