provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "demo_instance" {
  ami = "ami-033a6a056910d1137"
  instance_type = "t2.micro"
}