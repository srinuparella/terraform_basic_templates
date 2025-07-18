# Variable declare in VPC level
  variable "cidrvar" {
    type=string
    default = "10.0.0.0/16"
  }
  variable "vpcvar" {
    type=string
    default = "vpctag"
  }
   # Subets declare in VPC level
   variable "subaz" {
    type=list(string)
    default = ["us-east-2a","us-east-2b","us-east-2c","us-east-2a"]
  }
  variable "subcidr" {
    type=list(string)
    default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  }
  variable "subtag" {
    type=list(string)
    default = ["subnet1","subnet2","subnet3","subnet4"]
  }