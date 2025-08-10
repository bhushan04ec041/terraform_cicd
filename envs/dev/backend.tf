terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-for-terraform"
    key            = "envs/${terraform.workspace}/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
