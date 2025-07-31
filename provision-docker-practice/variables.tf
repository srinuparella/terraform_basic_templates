variable "submit" {
  type = object({
    vpcname = string
    vpccidr = string
    subnetsvalues = object({
      subcidr = list(string)
      subaz   = list(string)
      subtags = list(string)
    })
    gateway = object({
      igwname = string
    })
    route_config = object({
      routecidr = string
      routetag  = string
    })
    security_config = object({
      sgname = string
      sgdesc = string
    })
    ingress_config = object({
      ingdesc   = list(string)
      ifromport = list(number)
      itoport   = list(number)
      ippr      = list(string)
      icidr     = list(string)
      itag      = list(string)
    })
    egress_config = object({
      engdesc   = string
    #   efromport = number
    #   etoport   = number
      eippr     = string
      ecidr     = string
      etag      = string
    })
    s3bucket = object({
      bucketname = string
      tagname    = string
    })
  })

}