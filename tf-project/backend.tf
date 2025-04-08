terraform {
  backend "s3" {
    bucket         = "ahmed-1533-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock2"
  }
}