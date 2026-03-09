terraform {
  backend "s3" {
    bucket = "tf-agent-demo-state-bucket"
    key    = "ec2-demo/terraform.tfstate"
    region = "us-east-1"
  }
}

