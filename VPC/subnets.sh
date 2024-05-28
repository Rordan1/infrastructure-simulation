#!/bin/bash

---find vpc code + can use console for automatic subnet math---

# Define subnet CIDRs
SUBNET1="192.168.10.0/24"  # Application Layer
SUBNET2="192.168.20.0/24"  # Web Server Layer
SUBNET3="192.168.30.0/24"  # Database Layer

# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block 192.168.0.0/16 --query 'Vpc.VpcId' --output text)

# Create subnets
SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET1 --availability-zone us-east-1a --query 'Subnet.SubnetId' --output text)
SUBNET2_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET2 --availability-zone us-east-1b --query 'Subnet.SubnetId' --output text)
SUBNET3_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET3 --availability-zone us-east-1c --query 'Subnet.SubnetId' --output text)

# Copy IDs

echo "Subnet1 ID (Application Layer): $SUBNET1_ID"
echo "Subnet2 ID (Web Server Layer): $SUBNET2_ID"
echo "Subnet3 ID (Database Layer): $SUBNET3_ID"
