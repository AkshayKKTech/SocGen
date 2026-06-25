terraform {
  backend "s3" {
    bucket = "socgenforakshay"
    region = "eu-north-1"
    key = "terraform.tfstate"
    use_lockfile = true
  }
}