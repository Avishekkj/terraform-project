variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private SSH key for EC2 instance access"
  type        = string
}


variable "key_name" {
  
}
#variable "private_key_path" {}