
### ################################################### ###
### [[test-module]] testing terraform-aws-coreos-ami-id ###
### ################################################### ###

module zero-param-test
{
    source = ".."
}

/*
module vpc-1
{
    source       = "github.com/devops-ip/terraform-aws-vpc-subnets"
    in_vpc_cidr  = "10.123.0.0/16"
    in_ecosystem = "${ local.ecosystem_id }"
}

module security-group-test-1
{
    source         = ".."
    in_ingress     = [ "ssh", "http", "https" ]
    in_vpc_id      = "${ module.vpc-1.out_vpc_id }"
    in_use_default = "true"
    in_ecosystem   = "${ local.ecosystem_id }-01"
}

module vpc-2
{
    source       = "github.com/devops-ip/terraform-aws-vpc-subnets"
    in_vpc_cidr  = "10.124.0.0/16"
    in_ecosystem = "${ local.ecosystem_id }"
}

module security-group-test-2
{
    source         = ".."
    in_ingress     = [ "elasticsearch", "ssh", "java" ]
    in_egress      = [ "all-traffic" ]
    in_vpc_id      = "${ module.vpc-2.out_vpc_id }"
    in_use_default = "false"
    in_ecosystem   = "${ local.ecosystem_id }-02"
}
*/

output out_coreos_ami_id
{
    value = "${ module.zero-param-test.out_ami_id }"
}
