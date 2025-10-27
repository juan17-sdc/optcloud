provider "aws" {
region = "us-east-1"
}

resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
tags = {
Name = "VPC-03"
}
}

resource "aws_subnet" "subnet_a" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"
map_public_ip_on_launch = true
tags = {
Name = "Public Subnet A"
}
}
resource "aws_subnet" "subnet_b" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.2.0/24"
availability_zone = "us-east-1b"
map_public_ip_on_launch = true
tags = {
Name = "Public Subnet B"
}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Table route igw"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_g" {
  name        = "security_g"
  description = "security group"
  vpc_id      = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "security_g"
  }
}

resource "aws_instance" "instance_a" {
  ami           = "ami-07860a2d7eb515d9a" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.security_g.id]  
  key_name = "vockey"

  tags = {
    Name = "ec2-a"
  }
}

resource "aws_instance" "instance_b" {
  ami           = "ami-07860a2d7eb515d9a" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_b.id
  vpc_security_group_ids = [aws_security_group.security_g.id]  
  key_name = "vockey"
  
  tags = {
    Name = "ec2-b"
  }
}