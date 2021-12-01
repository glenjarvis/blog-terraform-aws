resource "aws_s3_bucket" "terraform_backend" {
  bucket = "com.glenjarvis.demo.terraform"
  acl    = "private"

  tags = {
    Name        = "Terraform State Backend"
    Environment = "Production"
  }
}
