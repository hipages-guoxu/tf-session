provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_security_group" "demo_instance_sg" {
  name = "demo-instance-sg"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo_instance" {
  ami = "ami-0b7dcd6e6fd797935"
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  vpc_security_group_ids= [aws_security_group.demo_instance_sg.id]
  tags = {
    Name = "demo"
  }
}