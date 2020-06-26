terraform {
  backend "s3" {
    bucket = "dany-terraform-state"
    key    = "cicd/example/terraform.tfstate"
    region = "us-east-2"
  }
}