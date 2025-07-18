        resource "aws_vpc" "vpc" {
        cidr_block = var.cidrvar
        tags ={
        Name = var.vpcvar
        }
        }
    # Earlier we are creating too many resources and variables
    # Now we are creating one resources and mentioned the all subnets,az's and cidr_block in one resource by using count 
    resource "aws_subnet" "subnet_pr" {
        count=4
        vpc_id = aws_vpc.vpc.id
        availability_zone = var.subaz[count.index]
        cidr_block =var.subcidr[count.index]
        tags ={
        Name = var.subtag[count.index]
    }
    }
  