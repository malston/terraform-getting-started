variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default = "us-east-1"
}

variable "amis" {
    default = {
        us-east-1 = "ami-aa7ab6c2"
        us-west-2 = "ami-23f78e13"
    }
}

variable "aws_vpc_cidr_block" {
    description = "The IPv4 address range that machines in the network are assigned to, represented as a CIDR block."
    default = "10.0.0.0/16"
}

variable "aws_subnet_cidr_block" {
    description = "The IPv4 address range that machines in the network are assigned to, represented as a CIDR block."
    default = "10.0.1.0/24"
}
