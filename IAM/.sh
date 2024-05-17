
# make admin account

# new user "Admin"

# attach AdministratorAccess policy

# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }

#  set up users + check if successful


aws iam create-user --user-name Carlos
aws iam create-user --user-name Novak
aws iam create-user --user-name Roger

aws iam list-users


#  set up groups + check if successful

aws iam create-group --group-name Developer 
aws iam create-group --group-name Engineers  

aws iam list-groups

# add users to groups 

aws iam add-user-to-group --group-name Developer --user-name Carlos
aws iam add-user-to-group --group-name Engineers --user-name Roger
aws iam add-user-to-group --group-name Engineers --user-name Novak 

# permissons policies 

aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRDSFullAccess \
 --group-name Developer
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRDSDataFullAccess \
 --group-name Developer
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AWSCloudShellFullAccess \
 --group-name Developer

aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess \
 --group-name Engineers
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess \
 --group-name Engineers
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AWSCloudShellFullAccess \
 --group-name Engineers

# access keys 

aws iam create-access-key \
    --user-name Carlos
aws iam create-access-key \
    --user-name Roger
aws iam create-access-key \
    --user-name Novak

# console access + additional password changing permissions

aws iam create-login-profile --user-name Carlos --password Temp-pass1 --password-reset-required
aws iam create-login-profile --user-name Roger --password Temp-pass2 --password-reset-required
aws iam create-login-profile --user-name Novak --password Temp-pass3 --password-reset-required

aws iam update-account-password-policy --allow-users-to-change-password


# cloudshell acccess


