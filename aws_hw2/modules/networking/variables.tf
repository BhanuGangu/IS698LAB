variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
