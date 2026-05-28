variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "ami_id" {
  type = string
}
variable "key_name" {
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
