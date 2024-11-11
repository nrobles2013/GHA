provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucketyul"
    tags = {
        Name = "My bucket_yul1"
        Environment = "Dev"
    }
}