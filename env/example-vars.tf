######
# Project name and general attributes
######
variable "project_name" {
  default = "MODULAR TERRAFORM"
}


######
# Terraform provider definition
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

######
# Environment terraform state file storage
######
terraform {
    backend "s3" {
        bucket = "modular-terraform-bucket"
        key = modular-terraform-state"
        region = "<YOUR AWS REGION>"
        encrypt = true
    }
}


######
# VPC variables
# Add more for multiple VPCs.
######
variable "vpcs" {
  default = {
    "DEV"  = {
      "name"     = "Modular Terraform Dev VPC"
      "description"    = "CIDR for the PROD VPC"
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
# Add more for multiple subnets.
###
variable "public_subnets" {
  default = {
    "MODULAR-PROD-PUBLIC-SUBNET-1"  = {
      "name"     = "MODULAR-PROD-PUBLIC-SUBNET-1"
      "description"    = "CIDR for the PROD Public 1 subnet"
      "cidr"  = "10.0.0.0/24"
      "availability_zone"  = "ap-southeast-1a"
      "env" =  "PROD" 
      "default_destination_cidr_block" = "0.0.0.0/0"
    },
    "MODULAR-PROD-PUBLIC-SUBNET-2"  = {
      "name"     = "PROD-PUBLIC-SUBNET-2"
      "description"    = "CIDR for the PROD Public 2 subnet"
      "cidr"  = "10.0.1.0/24"
      "name"     = "MODULAR-PROD-PUBLIC-SUBNET-2"
      "availability_zone"  = "ap-southeast-1b"   
      "env" =  "PROD"   
      "default_destination_cidr_block" = "0.0.0.0/0"    
    },
  }
}


###
# Private CIDR details (change to match VPCs)
# Add more for multiple subnets.
###
variable "private_subnets" {
  default = {
    "MODULAR-PROD-PRIVATE-SUBNET-1"  = {
      "description"    = "CIDR for the PROD Private 1 subnet"
      "cidr"  = "10.0.3.0/24"
      "name"     = "MODULAR-PROD-PRIVATE-SUBNET-1"
      "availability_zone"  = "ap-southeast-1a"
      "env" =  "PROD" # this must the same as VPC key
    },
    "MODULAR-PROD-PRIVATE-SUBNET-2"  = {
      "description"    = "CIDR for the PROD Private 2 subnet"
      "cidr"  = "10.0.4.0/24"
      "name"     = "MODULAR-PROD-PRIVATE-SUBNET-2"     
      "availability_zone"  = "ap-southeast-1b"
      "env" =  "PROD" # this must be the same as VPC key
    },
    "MODULAR-PROD-PRIVATE-SUBNET-3"  = {
      "description"    = "CIDR for the PROD Private 2 subnet"
      "cidr"  = "10.0.5.0/24"
      "name"     = "MODULAR-PROD-PRIVATE-SUBNET-3"     
      "availability_zone"  = "ap-southeast-1b"
      "env" =  "PROD" # this must be the same as VPC key
    },
  }
}




