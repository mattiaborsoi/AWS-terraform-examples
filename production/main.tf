#
# Remember to run the below export commands on a new device before using the
# 'terraform init' command
# %  export AWS_ACCESS_KEY_ID="accesskeyhere"
# %  export AWS_SECRET_ACCESS_KEY="secretkeyhere"
#


terraform {
  required_version = ">= 0.12"
        backend "s3" {
          bucket         = "mattiaborsoi-terraform-up-and-running-state"
          key            = "borsoi.co.uk/terraform.tfstate"
          region         = "eu-west-2"
          dynamodb_table = "terraform-up-and-running-locks"
          encrypt        = true
        }
}

provider "aws" {
  region = "eu-west-2"
}

# check db.tf for deployment of the DB for terraform locks
# check webserver.tf for the deployment of the web servers cluster
