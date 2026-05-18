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
