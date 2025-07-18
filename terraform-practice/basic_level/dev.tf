resource "aws_vpc" "vpcresource" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dummyvpc"
  }
}
resource "aws_subnet" "subnets" {
  vpc_id =aws_vpc.vpcresource.id
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "subnet1"
  }
}
resource "aws_subnet" "subnets2" {
  vpc_id =aws_vpc.vpcresource.id
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subnet2"
  }
}
resource "aws_subnet" "subnets3" {
  vpc_id =aws_vpc.vpcresource.id
  availability_zone = "ap-south-1c"
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "subnet3"
  }
}