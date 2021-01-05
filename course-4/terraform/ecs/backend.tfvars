/*
   Variables for Terraform Backends (S3)
*/

bucket          =   "jhsong-terraform-bucket"          # AWS S3 bucket name for backend
key             =   "jhsong-terraform-c4-ecs"          # AWS S3 object key for tfstate file
region          =   "us-east-1"
dynamodb_table  =   "jhsong-terraform-c4-ecs"          # support locking via DynamoDB
