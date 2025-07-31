terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
  required_version = "~> 1.12.2"
         backend "s3" {
      #    bucket = var.submit.s3bucket.bucketname
      #    backend "s3" block inside terraform block is not allowed to use variables
         bucket = "remotestorage123"
         key    = "dev/statefiles/terraform_state_file"
         region = "ap-south-1"
     }
}


provider "aws" {
  region = "ap-south-1"
}