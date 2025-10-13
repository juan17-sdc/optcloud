provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "Ejercicio1" {
  ami           = "ami-03c4f11b50838ab5d" 
  instance_type = "t3.micro"

  tags = {
    Name = "Esta instancia es parte del ejercicio 1 de juan carlos sá da costa"
  }
}


resource "aws_instance" "Ejercicio1-2" {
  ami           = "ami-03c4f11b50838ab5d" 
  instance_type = "t3.micro"

  tags = {
    Name = "Esta instancia es parte del ejercicio 1 de juan carlos sá da costa"
  }
}
