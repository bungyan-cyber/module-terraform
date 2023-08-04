output "private_subnet_id" {
  value = [for i in aws_subnet.private_subnet : i.id]
}

output "public_subnet_id" {
  value = [for i in aws_subnet.public_subnet : i.id]
}
