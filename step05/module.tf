terraform {
    backend "s3" {
        bucket = "terraform-cha"
        key    = "terraform.tfstate"
    }
}


provider "aws" {
    region = "ap-northeast-1"
}

module "mod" {
    source  = "./src"
    sg_name = "sg05"
    instance_type = "t2.micro"
    key_name = "homekey"
    vm_name = "step05"
}
