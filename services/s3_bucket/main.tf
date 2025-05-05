provider "aws" {
    region ="ap-southeast-2"
    profile = "default"
    }

resource "aws_s3_bucket" "terraform_s3_bucket" {
    bucket = "1mayterraformawsbucket"
    
  tags = {
    Name        = "1mayterraformawsbucket"
    Environment = "QA"
  }
}
