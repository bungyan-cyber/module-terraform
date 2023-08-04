resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.eip_id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.internet_gateway]
}
