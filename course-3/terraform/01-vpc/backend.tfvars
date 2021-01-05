/*
   Variables for Terraform Backends (S3)
*/

bucket          =   "fc-terraform-bucket"          # AWS S3 bucket name for backend
key             =   "jhsong-terraform-c3-vpc"      # AWS S3 object key for tfstate file
region          =   "us-east-1"
dynamodb_table  =   "fc-terraform-c3-vpc"          # support locking via DynamoDB (required primary key: LockID)
