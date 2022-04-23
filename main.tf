provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_security_group" "my_security_group" {
  name        = var.security_group
  description = "SG for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.security_group
  }
}


resource "aws_instance" "my_instance" {
  ami                    = data.aws_ami.AMIWindows.id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= [var.security_group]
  tags= {
    Name = var.tag_name
  }
}


resource "aws_eip" "my_eip" {
  vpc      = true
  instance = aws_instance.my_instance.id
tags= {
    Name = "myEIP"
  }
}
