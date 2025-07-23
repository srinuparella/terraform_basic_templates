# ## assigned values for using .tfvars to variables

# lengthcount {
#     type = object({
#  pr_region  = "us-east-2"
#     vpcname = "dummyvpc"
#     vpccidr = "192.168.0.0/16"
#     public_private_subnets=object({
#     subcidr = ["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
#     subaz   = ["us-east-2a","us-east-2b","us-east-2c","us-east-2a"]
#     subname = ["public_subnet_1","public_subnet_2","private_subnet_1","private_subnet_2"]     
#     igwname ="My Dummy IGW "          
#     routecidr = "0.0.0.0/0"
#     routename = "My dummy route_table"           
#                 })
          
#   })
  
# }

lengthcount = {
  pr_region = "us-east-2"
  vpcname   = "dummyvpc"
  vpccidr   = "192.168.0.0/16"

  public_private_subnets = {
    subcidr = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
    subaz   = ["us-east-2a", "us-east-2b", "us-east-2c", "us-east-2a"]
    subname = ["public_subnet_1", "public_subnet_2", "private_subnet_1", "private_subnet_2"]
  }

  igw_tag = {
    igw_name = "My Dummy IGW"
  }

  route_table_tag = {
    routecidr = "0.0.0.0/0"
    routename = "My dummy route_table"
  }
  sgvariables = {
    sgname = "Dummy SG"
    sgdescri= "open all traffic"
    sgtagname= "Security Group 1"
}
sgingress ={
    indescr = ["Allow SSH","Allow HTTPS"]
    infrmport = [22,443]
    intoport =[22,443]
    inipproto = ["tcp","tcp"]
    intagname =["Firsst Ingress Rule","Second Ingress Rule"]
    cidr_ipv4=["0.0.0.0/0","0.0.0.0/0"] }
# sgingress = [
#   {
#     indescr   = "Allow SSH"
#     infrmport = 22
#     intoport  = 22
#     inipproto = "tcp"
#     intagname = "SSH Rule"
#   },
#   {
#     indescr   = "Allow HTTPS"
#     infrmport = 443
#     intoport  = 443
#     inipproto = "tcp"
#     intagname = "HTTPS Rule"
#   }
# ]

}