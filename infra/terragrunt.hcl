generate "aws" {
  path      = "auto-aws.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "Terraform" = "true"
      "App" = "personal-webpage"
    }
  }
}
EOF
}

generate "backend" {
  path      = "auto-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket = "infra-29087"
    key    = "webpage/${path_relative_to_include()}/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}
EOF
}
