output "instance_id" {
  value = [for i in aws_instance.instance : i.id]
}
