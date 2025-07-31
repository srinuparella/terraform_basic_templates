submit = {
  vpcname = "myproduction_VPC"
  vpccidr = "192.168.0.0/16"

  subnetsvalues = {
    subcidr = ["192.168.0.0/24", "192.168.1.0/24"]
    subaz   = ["ap-south-1a", "ap-south-1b"]
    subtags = ["PROVISIONERS_SUBNET", "DOCKER_SUBNET"]
  }
  gateway = {
    igwname = "Internet Gateway"
  }

  route_config = {
    routecidr = "0.0.0.0/0"
    routetag  = "Route Table PR"
  }
  security_config = {
    sgname = "DUMMY PROD SG"
    sgdesc = "Allow Traffic"
  }
  ingress_config = {
    ingdesc   = ["Allow inbound_ssh", "Allow inbound HTTPS","Allow inbound HTTP"]
    ifromport = [22, 443,80]
    itoport   = [22, 443,80]
    ippr      = ["tcp", "tcp","tcp"]
    icidr     = ["0.0.0.0/0", "0.0.0.0/0","0.0.0.0/0"]
    itag      = ["1 ingress rule", "2 ingress rule","3rd ingress rule"]
  }
  egress_config = {
    engdesc   = "open all outbound"
    # efromport = 0
    # etoport   = 0
    eippr     = "-1"
    ecidr     = "0.0.0.0/0"
    etag      = "egress rule"
  }
  s3bucket = {
    bucketname = "remotestorage123"
    tagname    = "creating s3 for backend purpose"
  }
}
        