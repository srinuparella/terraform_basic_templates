    resource "aws_vpc" "vpc" {
    cidr_block = var.assignvar_values.varcidr
    tags = {
        Name = var.assignvar_values.varname
    }
    }

    resource "aws_subnet" "subnets" {
    count = length(var.assignvar_values.subnets.subname)
    vpc_id = aws_vpc.vpc.id
    availability_zone =var.assignvar_values.subnets.subvaraz[count.index]
    cidr_block = var.assignvar_values.subnets.subvarcidr[count.index]
    tags = {
    Name=var.assignvar_values.subnets.subvarcidr[count.index]
    }
    }
  