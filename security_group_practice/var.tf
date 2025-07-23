# ## Assigned variables 

# variable "lengthcount" {
#   type = object({
# pr_region   = string 
#     vpcname = string
#     vpccidr = string
#     public_private_subnets=object({
#     subcidr = list(string)
#     subaz   = list(string)
#     subname = list(string)  
#     igwname = string
#     routecidr = string
#     routename = string
#                 })       
#   })
# }
variable "lengthcount" {
  type = object({
    pr_region = string
    vpcname   = string
    vpccidr   = string

    public_private_subnets = object({
      subcidr = list(string)
      subaz   = list(string)
      subname = list(string)
    })

    igw_tag = object({
      igw_name = string
    })

    route_table_tag = object({
      routecidr = string
      routename = string
    })
    sgvariables = object({
    sgname = string
    sgdescri=string
    sgtagname=string
  })
  sgingress   = object({
    indescr   = list(string)
    infrmport = list(number)
    intoport  = list(number)
    inipproto = list(string)
    intagname = list(string)
    cidr_ipv4=list(string)
  })
      
    
  
  })
}

