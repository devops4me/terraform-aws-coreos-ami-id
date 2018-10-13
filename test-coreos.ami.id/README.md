
# Integration Tests | CoreOS AMI AD | Terraform Module

You can [run the integration tests](coreos.ami.id-test.tf) that will retrieve retrieve CoreOS AMI IDs for the region denoted by the AWS credentials as well as for every viable AWS region that exists today.

## Usage

    $ git clone https://github.com/devops-ip/terraform-aws-coreos-ami-id.git
    $ cd terraform-aws-coreos-ami-id
    $ terraform init .
    $ terraform apply -auto-approve
    $ terraform destroy -auto-approve

## Pre-Conditions

Check before you run the test that

- terraform and git are installed
- you have created an AWS IAM user with VPC permissions
- your [AWS credentials have been installed](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)
