/*
   Variables for Terraform Backends (S3)
*/

bucket          =   "jhsong-terraform-bucket"          # AWS S3 bucket name for backend
key             =   "jhsong-terraform-c4-ecr"          # AWS S3 object key for tfstate file
region          =   "us-east-1"
dynamodb_table  =   "jhsong-terraform-c4-ecr"          # support locking via DynamoDB
