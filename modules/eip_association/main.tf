resource "aws_eip_association" "eip_association" {
  instance_id   = var.instance_id
  allocation_id = var.eip_id
}
