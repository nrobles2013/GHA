provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucketyul"
    tags = {
        Name = "S3Bucket_terraform"
        Environment = "development"
    }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "log-bucket"
  tags = {
        Name = "LogBucket_terraform"
        Environment = "development"
    }
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  bucket =  aws_s3_bucket.example.id  
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "/log/"
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
    bucket = aws_s3_bucket.example.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
  
}