module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "my-cluster"
  count = 2

  ami                    = "ami-c2680fa4"
  instance_type          = "t2.micro"
  key_name               = "homekey"
  monitoring             = false
  vpc_security_group_ids = ["sg-d8e983a1"]
  subnet_id              = "subnet-f45070dc"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
