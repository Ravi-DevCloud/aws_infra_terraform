variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_routes" {
  type    = string
  default = "0.0.0.0/0"
}

variable "nginx_port" {
  type    = number
  default = 80
}

variable "protocol" {
  type = string
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "sg_cidr_block" {
  type = list(string)
}
variable "sg_outbound_port" {
  type = number
}
variable "sg_outbound_protocol" {
  type = string
}
variable "ec2_ami" {
  type = string
}
variable "instance_type" {
  type = string
}