terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = "~> 1.0.0"

  backend "remote" {
    organization = "eknert"

    workspaces {
      name = "opa-cicd-demo"
    }
  }
}

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
    Owner = "Anders Eknert"
    Team = "Styra"
    Project = "OPA Demo"
  }
}
