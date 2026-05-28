variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet_a_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "subnet_b_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
