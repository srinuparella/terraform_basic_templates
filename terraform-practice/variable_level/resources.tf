    resource "aws_vpc" "vpc" {
      cidr_block = var.cidrvar
      tags = {
        Name = var.varvpc
      }
    }
        resource "aws_subnet" "subnet1" {
        vpc_id=aws_vpc.vpc.id
        cidr_block = var.subnet1_cidr
        availability_zone = var.subnet1_az
        tags = {
          Name = var.subnet1_tag
        }
        }
        resource "aws_subnet" "subnet2" {
        vpc_id=aws_vpc.vpc.id
        cidr_block = var.subnet2_cidr
        availability_zone = var.subnet2_az 
        tags = {
          Name = var.subnet2_tag
        }
        }
        resource "aws_subnet" "subnet3" {
        vpc_id=aws_vpc.vpc.id
        cidr_block = var.subnet3_cidr
        availability_zone = var.subnet3_az
        tags = {
          Name = var.subnet3_tag
        }
        }

        # Now we wii creating Variable level writing
        # in above code we have created 3 subnets in different availability zones
        # in ap-south-1 region, each subnet has a different CIDR block 
        # now we will create a variable to store the VPC ID and use it in the subnets
        
        # Declare the variables

        # In Vpc we will use the variable for CIDR block and VPC name
        variable "cidrvar"  {
        type = string
        default = "192.168.0.0/16"
        }
        variable "varvpc"  {
        type = string
        default = "my_workspace_vpc"
        }

        # In Subnet we will use the variable for availability zone , CIDR block and Subnet names
        # Subnet-1
        variable "subnet1_cidr"  {
        type = string
        default = "192.168.0.0/24"
        }
        variable "subnet1_az"  {
        type = string
        default = "ap-south-1a" 
        } 
        variable "subnet1_tag"  {
        type = string
        default = "my_workspace_subnet1"
        }
        # Subnet-2
        variable "subnet2_cidr"  {
        type = string
        default = "192.168.1.0/24"
        }
        variable "subnet2_az"  {
        type = string
        default = "ap-south-1b" 
        } 
        variable "subnet2_tag"  {
        type = string
        default = "my_workspace_subnet2"
        }

        # Subnet-3
        variable "subnet3_cidr"  {
        type = string
        default = "192.168.2.0/24"
        }
        variable "subnet3_az"  {
        type = string
        default = "ap-south-1c" 
        } 
        variable "subnet3_tag"  {
        type = string
        default = "my_workspace_subnet3"
        }
        