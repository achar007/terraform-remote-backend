provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "ubuntu" {
    ami           = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = "subnet-030fbf10e527bde0b"
    tags = {
        Name = "UbuntuInstance"
    }
  
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "my-terraform-state-bucket-unique-xyz-12345"
  
}

resource "aws_dynamodb_table" "tflock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "TerraformLockTable"
  }
  
}