#!/bin/bash

# Script designed to produce a JSON formatted listing of
# the EC2 CoreOS AMI IDs within the specified region. The
# returned json will contain two string keys called "hvm"
# and "pv" - the latter may be an empty string.

# --- ------------------------------- --- #
# --- Example - JSON Result           --- #
# --- ------------------------------- --- #
#    {
#      "hvm": "ami-099b2d1bdd27b4649",
#      "pv": "ami-0d9ae8e150fb07db3"
#    }

# Exit if any of the intermediate steps fail
set -e

#
# Argument 1 | AWS Region Code
#
# Assume that first command line argument is AWS region.
# us-east-1 and eu-west-2 are examples of valid arguments.
#
AWS_REGION="$1"

#
# Use curl to retrieve the JSON formatted result.
# Use jq to select AMIs in the specified region.
#
curl -s https://coreos.com/dist/aws/aws-stable.json | jq -r --arg REGION "$AWS_REGION" '.[$REGION]'
