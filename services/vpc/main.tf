# main.tf
provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_vpc" "terraform_vpc_destroy" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "step-vpc"
  }
}

output "vpc_id" {
  value= aws_vpc.terraform_vpc_destroy.id
}

#variable "vpc_id" {}
variable "availability_zone" {
  default = "ap-southeast-2a"
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.terraform_vpc_destroy.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "terraform_step-private-subnet"
  }
}

output "subnet_id" {
  value = aws_subnet.private.id
}


#variable "subnet_id" {}
variable "ami" {
  default = "ami-0f6a1a6507c55c9a8"
}
variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  associate_public_ip_address = false

  tags = {
    Name = "step-ec2-instance"
  }
}