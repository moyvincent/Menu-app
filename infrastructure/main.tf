terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

#EC2 instance
resource "aws_instance" "menu_server" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "eksKeyPair"

  tags = {
    Name = "Menuproject"
    project = "Menu_app"
  }
}

#Security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic on port 22 and 5000"

  ingress {
    description      = "TLS from VPC allow on port 5000"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC allow on port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
    project = "Menu_app"
  }
}

