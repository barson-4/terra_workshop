provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "ec2" {
    ami  = "ami-c2680fa4"      # Amazon Linux 2 LTS Candidate AMI 2017.12.0 (HVM), SSD Volume Type
    instance_type = "t2.micro"
}
