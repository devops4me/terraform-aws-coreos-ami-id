
# Get CoreOS AMI ID

**Hardcoding AMI IDs, account IDs, region codes, subnet cidrs and Route53 zone IDs brings duplication into your Terraform code, makes it brittle and prevents you running it in different regions and accounts.**

Use this module to dynamically retrieve the CoreOS AMI ID for your region instead of just hardcoding it in.


## Usage

    module coreos_ami_id
    {
        source = "github.com/devops4me/terraform-aws-coreos-ami-id"
    }


    resource aws_instance mini
    {
        ami           = "${module.coreos_ami_id.out_ami_id}"
        instance_type = "t2.micro"
    }

Put the above in a file named foo.tf, go to the directory and run it.

    $ terraform init .
    $ terraform -auto-approve apply


## Input ( HVM vs PV )

The CoreOS AMI for HVM virtualization is the assumed default. HVM (hardware virtual machine) makes use of virtualization extensions in hardware and now performs better than paravirtual (PV) machines.

**[Linux HVM / PV virtualization types - Explained](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html)**.

    module coreos_ami_id
    {
        source    = "github.com/devops4me/terraform-aws-coreos-ami-id"
        in_use_pv = "true"
    }

To insist on PV set **in_use_pv** to true **but beware** that some regions lack a paravirtual CoreOS image.

### AWS Regions Without a CoreOS ParaVirtual AMI

| Region Name | Region Code |
|:----------- |:----------- |
Asia Pacific (Seoul) | ap-northeast-2
Asia Pacific (Mumbai) | ap-south-1
Canada (Central) | ca-central-1
China (Ningxia) | cn-northwest-1
EU (London) | eu-west-2
EU (Paris) | eu-west-3
US East (Ohio) | us-east-2


## Output

**out_ami_id** is the only output from this module representing the EC2 AMI ID for CoreOS in your AWS region and selected virtualization type.


## Pre-Conditions

Just double check that

 - you have terraform and git intalled (or Terraform Enterprise)
 - your [AWS credentials have been installed](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html) in the right place/s
 - if PV is chosen a CoreOS AMI exists for the region (see above table)


### Contributing

Bug reports and pull requests are welcome on GitHub at the https://github.com/devops4me/terraform-aws-vpc-network page. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

License
-------

MIT License
Copyright (c) 2006 - 2014

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
