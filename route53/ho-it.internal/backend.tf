terraform {
  backend "s3" {
    bucket         = "hoit-apnortheast2-tfstate"
    key            = "hoit/terraform/route53/hoit/ho-it.internal/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
