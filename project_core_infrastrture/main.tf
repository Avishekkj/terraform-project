
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  name       = var.vpc_name
}

module "public_subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  name              = var.subnet_name
}

module "internet-gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  name   = "my-internet-gateway"
}

module "public_route_table" {
  source             = "./modules/route_table"
  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.internet-gateway.internet_gateway_id
  subnet_id          = module.public_subnet.subnet_id
  name               = "public-route-table"
}


module "security_group" {
  source = "./modules/security_group"  # Path to the security group module

  vpc_id = module.vpc.vpc_id  # Pass the VPC ID to the module
}


resource "aws_key_pair" "terraform_key" {
  key_name   = "my-terraform-key"
  public_key = file("/Users/avishekjha/.ssh/my_terraform_key.pub")
}

module "ec2_instance" {
  source         = "./modules/ec2_instance"
  ami_id         = "ami-0f6a1a6507c55c9a8"  # Replace with your desired AMI ID
  instance_type  = "t2.micro"
  subnet_id      = module.public_subnet.subnet_id # Choose the first subnet ID
  security_group_ids  = [module.security_group.security_group_id] 
  key_name           = aws_key_pair.terraform_key.key_name
  private_key_path   = var.private_key_path
  #private_key_path = "~/.ssh/my_private_key.pem"  # Path to your SSH private key
}
