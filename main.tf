terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

#resource "random_pet" "this" {
#  length = 5
#}

module "bucket" {
  source = "./s3_module"
  name   = var.bucket_name
}

#resource "random_pet" "website" {
#  length = 5
#}

module "website" {
  source = "./s3_module"
  name   = var.bucket_name

  versioning = {
    enabled = true
  }

  acl   = "public-read"
  files = "${path.root}/website"

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action":[
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
  ]
}
EOT
}
