resource "aws_db_instance" "db_instance" {
  allocated_storage = 10
  db_name           = "mydb"
  engine            = "mariadb"
  engine_version    = "10.5"
  instance_class    = "db.t3.micro"
  username          = "foo"
  password          = "foobarbaz"
  # parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  # availability_zone    = "ap-southeast-1a"
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "cloud-db-subnet"
  subnet_ids = var.subnet_group

  tags = {
    Name = "My DB subnet group"
  }
}
