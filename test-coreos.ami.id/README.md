
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

## Example Test Log Output

    The CoreOS AMI ID for London eu-west-2 is ami-099b2d1bdd27b4649.

The below test log output was retrieved from a run in the London region.

    data.external.ami: Refreshing state...
    data.external.ami: Refreshing state...
    data.external.ami: Refreshing state...
    data.aws_region.with: Refreshing state...
    data.aws_region.with: Refreshing state...
    data.aws_region.with: Refreshing state...

    Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

    Outputs:

    out_coreos_ami_id = ami-099b2d1bdd27b4649
    out_coreos_ami_log = The CoreOS AMI ID for London eu-west-2 is ami-099b2d1bdd27b4649.
    out_coreos_hvm_ami_id = ami-099b2d1bdd27b4649
    out_coreos_pv_ami_id = ami-0d9ae8e150fb07db3
