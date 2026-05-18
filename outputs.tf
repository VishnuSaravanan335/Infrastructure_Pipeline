output "alb_dns_name" {
  value = module.compute.alb_dns_name
}

output "dynamodb_table_name" {
  value = module.database.table_name
}

output "s3_bucket_name" {
  value = module.storage.bucket_name
}
