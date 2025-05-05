terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "MyVPC"
}

module "private_subnet" {
  source                  = "./modules/subnet"
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
  name                    = "MyPrivateSubnet"
}

module "ec2_instance" {
  source                      = "./modules/ec2"
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = module.private_subnet.subnet_id
  associate_public_ip_address = false
  name                        = "MyPrivateEC2"
}
