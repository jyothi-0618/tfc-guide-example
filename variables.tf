# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "bucket_name" {
  description = "jyo"
  default     = "my-terraform-bucket"
}

variable "acl" {
  description = "Access control list for the S3 bucket"
  default     = "private"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = {
    Name        = "Terraform S3 Bucket"
    Environment = "Development"
  }
}
