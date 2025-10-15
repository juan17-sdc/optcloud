provider "aws" {
region = "us-east-1"
}

# VPC
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"

tags = {
Name = "VPC 1"
}
}


# Subnets
resource "aws_subnet" "subnet_a" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.32.0/25"
availability_zone = "us-east-1a"

tags = {
Name = "SubnetA"
}
}

resource "aws_subnet" "subnet_b" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.30.0/23"
availability_zone = "us-east-1a"

tags = {
Name = "SubnetB"
}
}

resource "aws_subnet" "subnet_c" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.33.0/28"
availability_zone = "us-east-1a"

tags = {
Name = "SubnetC"
}
}



# --- EC2 Instances ---

# Subnet A
resource "aws_instance" "subnet_a_vm1" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_a.id

tags = {
Name = "Instancia1-SA"
}
}

resource "aws_instance" "subnet_a_vm2" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_a.id

tags = {
Name = "Instancia2-SA"
}
}

# Subnet B
resource "aws_instance" "subnet_b_vm1" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_b.id

tags = {
Name = "Instancia1-SB"
}
}

resource "aws_instance" "subnet_b_vm2" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_b.id

tags = {
Name = "Instancia2-SB"
}
}

# Subnet C
resource "aws_instance" "subnet_c_vm1" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_c.id

tags = {
Name = "Instancia1-SC"
}
}

resource "aws_instance" "subnet_c_vm2" {
ami = "ami-052064a798f08f0d3"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet_c.id

tags = {
Name = "Instancia2-SC"
}
}