# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------


variable "elb_port" {
  description = "The port the ELB will use for HTTP requests"
  type        = number
  default     = 80
}



variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  default = "terraform-asg-webserver"
}

variable "cluster_name-elb" {
  description = "The name to use for all the cluster resources"
  default = "terraform-asg-webserver-elb"
}

variable "cluster_name-instance" {
  description = "The name to use for all the cluster resources"
  default = "terraform-asg-webserver-instance"
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  default = "mattiaborsoi-terraform-up-and-running-state"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  default = "borsoi.co.uk/terraform.tfstate"
}

variable "dynamodb_table" {
  description = "The path for the database's remote state in S3"
  default = "terraform-up-and-running-locks"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  default = "t2.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  default = "1"
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  default = "5"
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  default = true
}

variable "ami" {
  description = "The AMI to run in the cluster"
  default     = "ami-006a0174c6c25ac06"
}

variable "aws_region" {
  description = "The AWS region to use"
  default = "eu-west-2"
}
