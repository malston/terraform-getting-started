provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-aa7ab6c2"
    instance_type = "t1.micro"

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > file.txt"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}
