variable "region" {
  description = "The AWS region to deploy the infrastructure."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use for EC2 instances."
  type        = string
}

variable "db_table_name" {
  description = "The name of the DynamoDB table for the application."
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for application storage."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
