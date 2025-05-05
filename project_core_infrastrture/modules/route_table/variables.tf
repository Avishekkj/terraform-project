variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table"
  type        = string
}

variable "name" {
  description = "Name of the route table"
  type        = string
}
