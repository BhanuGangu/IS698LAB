provider "aws" {
  region = "us-east-1"   # Replace with your desired region
  profile = "default"    # Optional, if you're using a named profile from AWS CLI config
}




variable "instances" {
  type = map
  default = {
    "web1" = "t2.micro"
    "web2" = "t2.micro"
    "web3" = "t2.micro"
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-00a929b66ed6e0de6"
  instance_type = each.value

  tags = {
    Name = "${each.key}"
  }
}

