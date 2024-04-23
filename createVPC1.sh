#!/usr/bin/bash

#problem1.2

#VPCID = $(aws ec2 create-vpc --cidr-block 10.10.0.0/16 \
#       --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=AWSCookbook201}]' \
#       --output text --query Vpc.VpcId)
#
VPCID="vpc-077ae3f5e1a7e16cd" 
echo "Creating VPC 9: $VPCID"

function delay_if_not_avilable(){

        # if the status of the vpc is not "something", i want you to add a buffer and messege
        # additionally maybe consier generating a log that states the action performed by the script.


        vpc_status=$(aws ec2 describe-vpcs --vpc-ids $VPCID | jq -r '.Vpcs[].State')
        echo $vpc_status
}


echo $VPC_STATUS

sleep 3

echo "task2"
sleep 3

echo "task3"
sleep 3
