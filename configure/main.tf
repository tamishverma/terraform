provider "aws" {
  region = "ap-south-1"
}

variable "ingressrule" {
  type = list(number)
  default = [40,443]
}

variable "egressrule"{
  type = list(number)
  default = [8080,5000,443,8080]
}

resource "aws_security_group" "mysg"{
  name = "Allow http and ssh"
  dynamic ingress {
    iterator = ports
    for_each = var.ingressrule
    content {
      to_port = ports.value
      from_port = ports.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic egress {
    iterator = eports
    for_each = var.egressrule
    content {
      to_port = eports.value
      from_port = eports.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_instance" "ec2instance" {
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.mysg.name]
    tags = {
      Name = "web_server"
    }
}