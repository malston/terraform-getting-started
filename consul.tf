module "consul" {
    source = "github.com/hashicorp/consul/terraform/aws"

    key_name = "consul"
    key_path = "/Users/malston/.ssh/consul.pem"
    region = "${var.region}"
    servers = "3"
}
