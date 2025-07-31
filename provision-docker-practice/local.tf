locals {
  subnet_level = length(var.submit.subnetsvalues.subcidr)
  sg_level     = length(var.submit.ingress_config.ifromport)
}