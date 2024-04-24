#!/usr/bin/bash


#
#
#

#VPCID="vpc-077ae3f5e1a7e16cd" 
#echo "Creating VPC 9: $VPCID"


    
function vpc_create(){
        
        VPCID=$(aws ec2 create-vpc --cidr-block 10.10.0.0/16 \
        --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=AWSCookbook201}]' \
        --output text --query Vpc.VpcId)
}


function vpc_check_status() {
        
    run=1

    while [[ $run -eq 1 ]]; do
    
        status=$(aws ec2 describe-vpcs --vpc-ids "$VPCID" | jq -r '.Vpcs[].State')

        if [[ "$status" == "available" ]]; then
            echo "VPC is ready for use!!!"
            echo "$status"
            test="true"
            run=0
            
        else
            echo "VPC not ready!!! a delay has been added."
            echo "$status"
            test="false"
            sleep 5
        fi
    done
}

function vpc_attach_network(){
        echo "0"
}

vpc_create
vpc_check_status
vpc_attach_network

