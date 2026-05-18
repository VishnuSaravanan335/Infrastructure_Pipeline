resource "aws_dynamodb_table" "app_db" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "AppID"

  attribute {
    name = "AppID"
    type = "S"
  }

  tags = { Name = "App-DynamoDB" }
}
