variable "sg_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "vm_name" {}

provider "aws" {
    region = "ap-northeast-1"
}

data "aws_ami" "amazon2_linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*"]
    }
}

resource "aws_security_group" "sg" {
    name = "${var.sg_name}"
    description = "Allow SSH inbound traffic"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "ec2" {
    ami  = "${data.aws_ami.amazon2_linux.id}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]
    key_name = "${var.key_name}"
    associate_public_ip_address = true
    tags {
        Name = "${var.vm_name}"
    }
}
