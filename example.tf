provider "aws" {
  access_key = "AKIAUYAEPYSQFCOJ4QF4"
  secret_key = "VkbYNnKA664Vzk23SKPsFik+jibj6ErvzDkTPVnz"
  region     = "eu-west-1"
}


resource "aws_instance" "example" {
  ami           = "ami-0cbf7a0c36bde57c9"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05ba919dd32be0c1b"]
  subnet_id = "subnet-0132e7817fbdbf2c0"
  key_name = "ireland-key"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
