output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
output "public_subnet_a_id" {
  value = aws_subnet.public_subnet_a.id
}
output "public_subnet_b_id" {
  value = aws_subnet.public_subnet_b.id
}
output "public_subnets" {
  value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}
