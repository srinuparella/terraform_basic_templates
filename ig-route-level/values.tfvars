vpc_subnets_assign = {
    var_vpc = "10.0.0.0/16"
    var_vpc_cidr = "myprodvpc"
    publicsubnets = {
      subcidr = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
      subaz   =   ["ap-south-1a","ap-south-1b","ap-south-1c","ap-south-1a"]
      subtags = ["subnet-1","subnet-2","subnet-3","subnet-4"]
    }
}