terraform {
  required_version = ">= 0.12"
  # ---------------------------------------------------------------------------
  # SET S3 FOR .tfstate
  # please note that you will need to run 'terraform init' without the
  # backend settings between this comment and the end of it to initially
  # generate the S3 and DB. Then uncomment 'backend' and 'init' all again
  # ---------------------------------------------------------------------------
        backend "s3" {
          bucket         = "mattiaborsoi-terraform-up-and-running-state"
          key            = "borsoi.co.uk/terraform.tfstate"
          region         = "eu-west-2"
          dynamodb_table = "terraform-up-and-running-locks"
          encrypt        = true
        }
  # ---------------------------------------------------------------------------
  # End of backend settings
  # ---------------------------------------------------------------------------
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
