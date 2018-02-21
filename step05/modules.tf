variable "public_key_path" {
    default = "~/.ssh/id_rsa.pub"
}

resource "aws_key_pair" "my-key" {
    key_name   = "my-key"
    public_key = "${file(var.public_key_path)}"
}


module "vpc" {
  source ="terraform-aws-modules/vpc/aws"
  version = "1.9.0"

  name = "my-vpc"

  cidr = "10.0.0.0/16"
  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "to_ssh_from_all"
  vpc_id      = "${module.vpc.vpc_id}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_cluster" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "my-cluster"
  count = 2

  ami                    = "ami-c2680fa4"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.my-key.key_name}"
  monitoring             = true
  subnet_id              = "${module.vpc.public_subnets[0]}"
  vpc_security_group_ids = ["${module.sg.this_security_group_id}"]
  associate_public_ip_address = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output "ec2_public_ip" {
    value = "${module.ec2_cluster.public_ip}"
}
