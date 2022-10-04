######
# Project name and general project attributes, if any
######
variable "project_name" {
  default = "MODULAR TERRAFORM"
}


######
# Terraform provider definition. Presently, this code is written for version 3 (up to the latest before version 4) of the Terraform AWS provider module.
######
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 3.74.3"
      configuration_aliases = [ aws.us1 ]
      }
  }
}

provider "aws" {
  alias  = "us1"
  region = "us-east-1"
}

######
# Environment terraform state file storage. The bucket needs to be created with the 'bucket' name below. State files in the 'key' field can be changed according to the
# project or environment it is covering.
######
terraform {
    backend "s3" {
        bucket = "modular-terraform-bucket"
        key = modular-terraform-state-example1"
        region = "<YOUR AWS REGION>"
        encrypt = true
    }
}


######
# VPC variables
# This example is for 1 VPC.
######
variable "vpcs" {
  default = {
    "DEV"  = {
      "name"     = "Modular Terraform Dev VPC"
      "description"    = "CIDR for the DEV VPC"
      "default"   = "10.0.0.0/16"
      "enable_key_rotation" = "false"
    },
  }
}


######
# SUBNETS
######

###
# Public subnet variables
# This example is for 2 public subnets.
###
variable "public_subnets" {
  default = {
    "MODULAR-DEV-PUBLIC-SUBNET-1"  = {
      "name"     = "MODULAR-DEV-PUBLIC-SUBNET-1"
      "description"    = "CIDR for the DEV Public 1 subnet"
      "cidr"  = "10.0.0.0/24"
      "availability_zone"  = "ap-southeast-1a"
      "vpc" =  "DEV" 
      "default_destination_cidr_block" = "0.0.0.0/0"
    },
    "MODULAR-DEV-PUBLIC-SUBNET-2"  = {
      "name"     = "DEV-PUBLIC-SUBNET-2"
      "description"    = "CIDR for the DEV Public 2 subnet"
      "cidr"  = "10.0.1.0/24"
      "name"     = "MODULAR-DEV-PUBLIC-SUBNET-2"
      "availability_zone"  = "ap-southeast-1b"   
      "vpc" =  "DEV"   
      "default_destination_cidr_block" = "0.0.0.0/0"    
    },
  }
}


###
# Private CIDR details (change to match VPCs)
# This example is for 3 private subnets.
###
variable "private_subnets" {
  default = {
    "MODULAR-DEV-PRIVATE-SUBNET-1"  = {
      "description"    = "CIDR for the DEV Private 1 subnet"
      "cidr"  = "10.0.3.0/24"
      "name"     = "MODULAR-DEV-PRIVATE-SUBNET-1"
      "availability_zone"  = "ap-southeast-1a"
      "vpc" =  "DEV" # this must the same as VPC key
    },
    "MODULAR-DEV-PRIVATE-SUBNET-2"  = {
      "description"    = "CIDR for the DEV Private 2 subnet"
      "cidr"  = "10.0.4.0/24"
      "name"     = "MODULAR-DEV-PRIVATE-SUBNET-2"     
      "availability_zone"  = "ap-southeast-1b"
      "vpc" =  "DEV" # this must be the same as VPC key
    },
    "MODULAR-DEV-PRIVATE-SUBNET-3"  = {
      "description"    = "CIDR for the DEV Private 2 subnet"
      "cidr"  = "10.0.5.0/24"
      "name"     = "MODULAR-DEV-PRIVATE-SUBNET-3"     
      "availability_zone"  = "ap-southeast-1b"
      "vpc" =  "DEV" # this must be the same as VPC key
    },
  }
}




