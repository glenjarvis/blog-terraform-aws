terraform {
  backend "s3" {
    bucket = "com.glenjarvis.demo.terraform"
    key    = "state/terraform_state"
    region = "us-east-1"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

