
####### ########################################################################## ########
######## The external data source expects a python program in the module's folder. ########
####### ########################################################################## ########

### ################# ###
### [[data]] external ###
### ################# ###

data external ami {
    program = [ "bash", "${path.module}/coreos-ami-reader.sh", "${ data.aws_region.with.name }" ]
}


### ################### ###
### [[data]] aws_region ###
### ################### ###

data aws_region with {
}


######## ########################## ########
######## Variables for this module. ########
######## ########################## ########

### ###################### ###
### [[variable]] in_use_pv ###
### ###################### ###

variable in_use_pv {
    description = "Override default and get ID of paravirtual rather than the HVM CoreOS AMI."
    default = "false"
}



### ##################################################### ###
### [[local]] attributes for building the CoreOS AMI log. ###
### ##################################################### ###

locals {
    city_plus = "${ element( split( "(", data.aws_region.with.description ), 1 ) }"
    city_name = "${ element( split( ")", local.city_plus ), 0 ) }"
    pre_note  = "The CoreOS AMI ID for ${local.city_name} ${ data.aws_region.with.name } is"
}


################ ########################################### ########
################ Module [[[CoreOS AMI ID]]] Output Variables ########
################ ########################################### ########

### ##################### ###
### [[output]] out_ami_id ###
### ##################### ###

output out_ami_id {
    description = "EC2 AMI ID for CoreOS in your AWS region and selected virtualization type."
    value       = "${ data.external.ami.result[ var.in_use_pv ? "pv" : "hvm" ] }"
}


### ###################### ###
### [[output]] out_ami_log ###
### ###################### ###

output out_ami_log {
    description = "Log string detailing the region city region name and EC2 CoreOS AMI ID."
    value = "${local.pre_note} ${ data.external.ami.result[ var.in_use_pv ? "pv" : "hvm" ] }."
}
