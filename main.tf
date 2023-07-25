provider "aws" {
    region = "ap-south-1"
}
variable ingressrule {
    type = list(number)
    default = [80,443]
}

variable egressrule {
    type = list(number)
    default = [5000,8080,443,80]
}



resource "aws_security_group" "mysg"{
    name = "Allow http ports"

    dynamic ingress {
        iterator = ports
        for_each = var.ingressrule
        content {
          from_port = ports.value
          to_port = ports.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic egress {
        iterator = eports
        for_each = var.egressrule
        content {
            from_port = eports.value
            to_port = eports.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }

    }
}

resource "aws_instance" "db_server"{
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"

    tags = {
        Name = "db_server"
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web_server.id
}

resource "aws_instance" "web_server" {
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.mysg.name]
    count = 3
    user_data = file("myscript.sh")
    tags = {
        Name = "web_server"
    }
}

output "Private_IP" {
    value = aws_instance.db_server.private_ip
}
output "public_ip" {
    value = aws_eip.web_ip.public_ip
}

