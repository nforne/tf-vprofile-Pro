terraform {
  backend "s3" {
    bucket = "tf-s3-x"
    key    = "tf-cicd/tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-x"
  }
}