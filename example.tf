provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_vpc" "consul" {
    cidr_block = "${var.aws_vpc_cidr_block}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "consul"
    }
}

resource "aws_subnet" "consul" {
    vpc_id = "${aws_vpc.consul.id}"
    cidr_block = "${var.aws_subnet_cidr_block}"
    map_public_ip_on_launch = true
    tags {
        Name = "consul"
    }
}

resource "aws_internet_gateway" "consul" {
    vpc_id = "${aws_vpc.consul.id}"
}

resource "aws_route_table" "consul" {
    vpc_id = "${aws_vpc.consul.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.consul.id}"
    }
}

resource "aws_route_table_association" "consul" {
    subnet_id = "${aws_subnet.consul.id}"
    route_table_id = "${aws_route_table.consul.id}"
}

resource "aws_instance" "example" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t1.micro"

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > file.txt"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}
