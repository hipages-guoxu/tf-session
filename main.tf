provider "aws" {
  region = "ap-southeast-2"
}

module "demo-web" {
  source = "./modules/web-module"
  instance_type = "t2.micro"
  ami_id = "ami-0b7dcd6e6fd797935"
}