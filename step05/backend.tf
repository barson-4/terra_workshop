terraform {
    backend "s3" {
        bucket = "terraform-cha"
        key    = "terraform.tfstate"
    }
}
