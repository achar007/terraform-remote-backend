terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-xyz-12345"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

