provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "opa-tf-bucket" {
  bucket = "opa-tf-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    name = "opa-tf-bucket"
  }
}

# resource "aws_s3_bucket" "another-bucket2" {
#  bucket = "another-bucket"
#  acl    = "public-read"
#}