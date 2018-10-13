
####### ########################################################################## ########
######## The external data source expects a python program in the module's folder. ########
####### ########################################################################## ########

### ################# ###
### [[data]] external ###
### ################# ###

data external ami
{
    program = [ "bash", "${path.module}/coreos-ami-reader.sh", "eu-west-1" ]
}


####### ############################################# ########
######## Variables for the Terraform [[enis]] module. ########
######## ############################################ ########

### ######################## ###
### [[variable]] in_owner_id ###
### ######################## ###

variable in_owner_id
{
    description = "The id of the requester to filter on also known from the AWS console as attachment owner."
    default = "amazon-rds"
}


####### ######################################### ########
######## Output of the [[net.interfaces]] module. ########
####### ######################################### ########

### ########################### ###
### [[output]] out_ip_addresses ###
### ########################### ###

#### --> output out_ip_addresses
#### --> {
#### -->     description = "The IP addresses of active network interfaces within the given VPC and subnets."
#### -->     value       = "${ split( ",", data.external.eni-ips.result[ "ip_addresses" ] ) }"
#### --> }


################ ########################################### ########
################ Module [[[CoreOS AMI ID]]] Output Variables ########
################ ########################################### ########

### ##################### ###
### [[output]] out_ami_id ###
### ##################### ###

output out_ami_id
{
    description = "EC2 AMI ID for CoreOS in your AWS region and selected virtualization type."
    value       = "${ data.external.ami.result[ "hvm" ] }"
}
