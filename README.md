 ![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg)

 #  Playing with Terraform to deploy AWS instances

 ## Quick start

 **Note**: These examples deploy resources into your AWS account. Although all the resources should fall under the
 [AWS Free Tier](https://aws.amazon.com/free/), it is not my responsibility if you are charged money for this.

 1. Install [Terraform](https://www.terraform.io/).
 1. Set your AWS credentials as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
 1. `cd` into one of the example folders.
 1. Run `terraform init`.
 1. Run `terraform apply`.
 1. After it's done deploying, the example will output URLs or IPs you can try out.
 1. To clean up and delete all resources after you're done, run `terraform destroy`.


 ## Examples


  1. [single-web-server](./single-web-server): Deploy a single EC2 Instance with a web server that will return
        "Hello, World" for every request on port 8080.
  1. [cluster-of-web-servers](./cluster-of-web-servers): Deploy a cluster of EC2 Instances in an Auto Scaling Group
        (ASG) and an Elastic Load Balancer (ELB). The ELB listens on port 80 and distributes load across the EC2
        Instances, each of which runs the same "Hello, World" web server.
  1. [s3-backend](./s3-backend): Create an S3 bucket and DynamoDB table to use as a Terraform backend.
  1. [database](./database): Deploy MySQL on top of Amazon's Relational Database Service (RDS).
  1. [modules](./modules): Examples of reusable Terraform modules, including a module that can deploy a web server
        cluster on top of ASG with an ELB.
  1. [live](./live): Examples of how to deploy different live environments (i.e., staging, production) using the code
        from the `modules` folder.
  1. [loops-with-count](./loops-with-count): Examples of how to use the `count` parameters to "loop" over resources.        
  1. [loops-with-for-each](./loops-with-for-each): Examples of how to use `for_each` to "loop" over inline blocks.        
  1. [loops-with-for](./loops-with-for): Examples of how to use `for` to "loop" over individual values.        



   ## Production

[production](./production): Here is the the setup I've used for my demo site at borsoi.co.uk


## To do:

- auto-install VPN server and output keys
- open VPN and SSH ports
- auto-install HTTPS certificates and apache
- point elastic IP to load balancer
