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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Environment = "Production"
    Project     = "InfrastructurePipeline"
  }
}
