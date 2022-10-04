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
        key = modular-terraform-state-example2"
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
    "QA"  = {
      "name"     = "Modular Terraform QA VPC"
      "description"    = "CIDR for the QA VPC"
      "default"   = "10.1.0.0/16"
      "enable_key_rotation" = "false"
    },
    "DEMO"  = {
      "name"     = "Modular Terraform QA VPC"
      "description"    = "CIDR for the QA VPC"
      "default"   = "10.2.0.0/16"
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
    "MODULAR-QA-PUBLIC-SUBNET-1"  = {
      "name"     = "MODULAR-QA-PUBLIC-SUBNET-1"
      "description"    = "CIDR for the QA Public 1 subnet"
      "cidr"  = "10.1.0.0/24"
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "QA" # this must the same as VPC key
      "default_destination_cidr_block" = "0.0.0.0/0"
    },
    "MODULAR-QA-PUBLIC-SUBNET-2"  = {
      "name"     = "QA-PUBLIC-SUBNET-2"
      "description"    = "CIDR for the QA Public 2 subnet"
      "cidr"  = "10.1.1.0/24"
      "name"     = "MODULAR-QA-PUBLIC-SUBNET-2"
      "availability_zone"  = "<YOUR AWS REGION>"   
      "vpc" =  "QA" # this must the same as VPC key
      "default_destination_cidr_block" = "0.0.0.0/0"    
    },
    "MODULAR-DEMO-PUBLIC-SUBNET-1"  = {
      "name"     = "MODULAR-DEMO-PUBLIC-SUBNET-1"
      "description"    = "CIDR for the DEMO Public 1 subnet"
      "cidr"  = "10.2.0.0/24"
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "DEMO" # this must the same as VPC key
      "default_destination_cidr_block" = "0.0.0.0/0"
    },
    "MODULAR-DEMO-PUBLIC-SUBNET-2"  = {
      "name"     = "DEMO-PUBLIC-SUBNET-2"
      "description"    = "CIDR for the DEMO Public 2 subnet"
      "cidr"  = "10.2.1.0/24"
      "name"     = "MODULAR-DEMO-PUBLIC-SUBNET-2"
      "availability_zone"  = "<YOUR AWS REGION>"   
      "vpc" =  "DEMO" # this must the same as VPC key
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
    "MODULAR-QA-PRIVATE-SUBNET-1"  = {
      "description"    = "CIDR for the QA Private 1 subnet"
      "cidr"  = "10.1.3.0/24"
      "name"     = "MODULAR-QA-PRIVATE-SUBNET-1"
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "QA" # this must the same as VPC key
    },
    "MODULAR-QA-PRIVATE-SUBNET-2"  = {
      "description"    = "CIDR for the QA Private 2 subnet"
      "cidr"  = "10.1.4.0/24"
      "name"     = "MODULAR-QA-PRIVATE-SUBNET-2"     
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "QA" # this must be the same as VPC key
    },
    "MODULAR-QA-PRIVATE-SUBNET-3"  = {
      "description"    = "CIDR for the QA Private 2 subnet"
      "cidr"  = "10.1.5.0/24"
      "name"     = "MODULAR-QA-PRIVATE-SUBNET-3"     
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "QA" # this must be the same as VPC key
    },
    "MODULAR-DEMO-PRIVATE-SUBNET-1"  = {
      "description"    = "CIDR for the DEMO Private 1 subnet"
      "cidr"  = "10.2.3.0/24"
      "name"     = "MODULAR-DEMO-PRIVATE-SUBNET-1"
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "DEMO" # this must the same as VPC key
    },
    "MODULAR-DEMO-PRIVATE-SUBNET-2"  = {
      "description"    = "CIDR for the DEMO Private 2 subnet"
      "cidr"  = "10.2.4.0/24"
      "name"     = "MODULAR-DEMO-PRIVATE-SUBNET-2"     
      "availability_zone"  = "<YOUR AWS REGION>"
      "vpc" =  "DEMO" # this must be the same as VPC key
    },
  }
}




