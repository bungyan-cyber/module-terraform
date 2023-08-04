resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet[count.index]
  availability_zone = var.availability_zone
  tags = {
    Name = var.private_subnet[count.index]
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }
  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "route_association_private" {
  count          = length(aws_subnet.private_subnet)
  route_table_id = aws_route_table.route_table_private.id
  subnet_id      = aws_subnet.private_subnet[count.index].id
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = var.availability_zone
  tags = {
    Name = var.public_subnet[count.index]
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "route_association_public" {
  count          = length(aws_subnet.public_subnet)
  route_table_id = aws_route_table.route_table_public.id
  subnet_id      = aws_subnet.public_subnet[count.index].id
}
