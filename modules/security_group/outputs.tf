#output "ingress_security_group_id" {
#  value       = [for s in aws_security_group.ingress : s.id]
#  description = "ID of the created ingress security group"
#}
#
#output "egress_security_group_id" {
#  value       = [for s in aws_security_group.egress : s.id]
#  description = "ID of the created egress security group"
#}

#output "security_group_id" {
#  value = concat([for s in aws_security_group.ingress : s.id], [for s in aws_security_group.egress : s.id])
#}

output "security_group_id" {
  value = aws_security_group.security_group.id
}
