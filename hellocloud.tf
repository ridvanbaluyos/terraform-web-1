provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-5d72ff3e"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
