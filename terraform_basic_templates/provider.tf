terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~>6.6.0"
    }
    
  }
  required_version = "~> v1.12.2"

}




provider "aws" {
  region = "ap-south-1"
}