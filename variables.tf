variable "region" {
  description = "The AWS region to deploy the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
  default     = "ami-0236922087fa98b6e"
}

variable "key_name" {
  description = "The name of the SSH key pair to use for EC2 instances."
  type        = string
  default     = "Putty_key"
}

variable "db_table_name" {
  description = "The name of the DynamoDB table for the application."
  type        = string
  default     = "app-db"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for application storage."
  type        = string
  default     = "demo-app-storage-vishnu-2026"
}
