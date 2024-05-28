# Create security group
SG_APP=$(aws ec2 create-security-group --group-name sg-application --description "Application Layer SG" --vpc-id <your-vpc-id> --query 'GroupId' --output text)

    # Allow inbound traffic from application port
    aws ec2 authorize-security-group-ingress --group-id $SG_APP --protocol tcp --port 8080 --cidr <your-vpc-cidr>

    # Allow all outbound traffic
    aws ec2 authorize-security-group-egress --group-id $SG_APP --protocol all --port all --cidr 0.0.0.0/0

# Create webserver security group
SG_WEB=$(aws ec2 create-security-group --group-name sg-webserver --description "Web Server Layer SG" --vpc-id <your-vpc-id> --query 'GroupId' --output text)

    # Allow inbound HTTP (80) and HTTPS (443) traffic from anywhere
    aws ec2 authorize-security-group-ingress --group-id $SG_WEB --protocol tcp --port 80 --cidr 0.0.0.0/0
    aws ec2 authorize-security-group-ingress --group-id $SG_WEB --protocol tcp --port 443 --cidr 0.0.0.0/0

    # Allow inbound traffic from the Application Layer SG on the custom application port (e.g., 8080)
    aws ec2 authorize-security-group-ingress --group-id $SG_WEB --protocol tcp --port 8080 --source-group $SG_APP

# Create database security group
SG_DB=$(aws ec2 create-security-group --group-name sg-database --description "Database Layer SG" --vpc-id <your-vpc-id> --query 'GroupId' --output text)

    # Allow inbound traffic on the database port from the Application Layer SG
    aws ec2 authorize-security-group-ingress --group-id $SG_DB --protocol tcp --port 3306 --source-group $SG_APP
