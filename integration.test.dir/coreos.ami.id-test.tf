
### ################################################### ###
### [[test-module]] testing terraform-aws-coreos-ami-id ###
### ################################################### ###

module coreos-ami-id-default-test
{
    source = ".."
}

module coreos-ami-id-hvm-test
{
    source    = ".."
    in_use_pv = "false"
}

module coreos-ami-id-pv-test
{
    source    = ".."
    in_use_pv = "true"
}

output out_coreos_ami_log
{
    value = "${ module.coreos-ami-id-default-test.out_ami_log }"
}

output out_coreos_ami_id
{
    value = "${ module.coreos-ami-id-default-test.out_ami_id }"
}

output out_coreos_hvm_ami_id
{
    value = "${ module.coreos-ami-id-hvm-test.out_ami_id }"
}

output out_coreos_pv_ami_id
{
    value = "${ module.coreos-ami-id-pv-test.out_ami_id }"
}
