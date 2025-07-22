# variable "var_vpc" {
#   type = string
#   default = "10.0.0.0/16"
# }
# variable "var_vpc_cidr" {
#   type = string
#   default = "myprodvpc"
# }
# variable "subcidr" {
#   type = list(string)
#   default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
# }
  
# variable "subaz" {
#   type = list(string)
#   default = ["ap-south-1a","ap-south-1b","ap-south-1c","ap-south-1a"]
# }
# variable "subtags" {
#   type = list(string)
#   default = ["subnet-1","subnet-2","subnet-3","subnet-4"]
# }

variable "vpc_subnets_assign" {
  type = object({
    var_vpc = string
    var_vpc_cidr=string
    publicsubnets=object({
      subcidr = list(string)
      subaz = list(string)
      subtags =list(string)
    })
  })
  
}
