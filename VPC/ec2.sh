# Deploy EC2 instances (for each layer)

# TBD APP

aws ec2 run-instances \
    --image-id <your-ami-id> \
    --instance-type t2.micro \
    --key-name <your-key-pair-name> \
    --subnet-id <your-application-subnet-id> \
    --security-group-ids <your-application-security-group-id>

# NGINX WEB
aws ec2 run-instances \
    --image-id <your-ami-id> \
    --instance-type t2.micro \
    --key-name <your-key-pair-name> \
    --subnet-id <your-web-server-subnet-id> \
    --security-group-ids <your-web-server-security-group-id>

# RDS DB
aws rds create-db-instance \
    --db-instance-identifier mydbinstance \
    --db-instance-class db.t2.micro \
    --engine mysql \
    --allocated-storage 20 \
    --master-username mydbuser \
    --master-user-password mydbpassword \
    --subnet-group-name <your-database-subnet-group-name>

# OR create an EC2 instance with a database engine
# (similar to the application and web server instances)

# Configure security groups, route tables, and DNS as needed