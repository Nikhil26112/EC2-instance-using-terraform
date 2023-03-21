provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  # In public key enter your id_rsa.pub value or add key path
  public_key = file("${path.module}/id_rsa.pub") 
}

resource "aws_instance" "My-EC2-Instance" {
  ami           = "ami-09cd747c78a9add63"
  instance_type = "t2.micro"
  key_name      = "my-key"
  subnet_id     = aws_default_subnet.default.id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]
  tags = {
    Name = "My EC2 Instance"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default" {
  availability_zone = "us-east-1a"
  tags = {
    Name = "Default subnet"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh_"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
