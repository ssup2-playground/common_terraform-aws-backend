provider "aws" {
  profile = "default"
}

# S3 bucket for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-ssup2-playground"

  versioning {
    enabled = true 
  }
}

# DynamoDB for terraform state lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "tfstate-ssup2-playground"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
