terraform {
  backend "s3" {
    bucket         = "29aprilterraformawsbucket1234"
    key            = "dev/network/terraform.tfstate"
    region         = "ap-southeast-2"
    #dynamodb_table = "terraform-locks"
    #encrypt        = true
  }
}
