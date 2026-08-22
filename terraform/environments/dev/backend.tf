terraform {
  backend "s3" {
    bucket         = "terraformdevsecopsproject"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraformdevsecopsproject"
    encrypt        = true
  }
}
