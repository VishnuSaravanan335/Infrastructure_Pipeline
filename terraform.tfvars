region         = "us-east-1"
ami_id         = "ami-0236922087fa98b6e"
key_name       = "Putty_key"
db_table_name  = "app-db"
s3_bucket_name = "demo-app-storage-vishnu-2026"
instance_type  = "t3.micro"
azs            = ["us-east-1a", "us-east-1b"]
common_tags = {
  Environment = "Production"
  Project     = "InfrastructurePipeline"
}
