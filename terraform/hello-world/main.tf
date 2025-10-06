# configurar provider
provider "aws" {
    region = "us-east-1"  
}

# crear instancia
resource "aws_instance" "hello-world" { # Amazon Linux 2 AMI
    instance_type = "t2.micro"
    ami           = "ami-052064a798f08f0d3"

    tags = {
        Name = "teraform-primera-instancia"
    }
}