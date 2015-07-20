resource "aws_security_group" "consul" {
    vpc_id = "${aws_vpc.consul.id}"
}
