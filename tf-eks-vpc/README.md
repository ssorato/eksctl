# Terraform EKS network

Optional: save state in a s3 bucket

```tf
terraform {
  backend "s3" {
    bucket = "the-bucket-name"
    key    = "terraform-eks-vpc"
    region = "us-east-1"
  }
}
```