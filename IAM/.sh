
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

