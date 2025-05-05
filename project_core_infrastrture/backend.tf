terraform {
  backend "s3" {
    bucket         = "30aprilterraformawsbucket"
    key            = "enterprise/vpc/terraform.tfstate"
    region         = "ap-southeast-2"
    #dynamodb_table = "terraform-locks"
    #encrypt        = true
  }
}
