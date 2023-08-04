provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_file)
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = "172.14.0.0/16"
  vpc_name       = "vpc1"
  private_subnet = ["172.14.20.0/24"]
  public_subnet  = ["172.14.30.0/24"]
  subnet_name    = "subnet1"
}

module "security_group" {
  source             = "./modules/security_group"
  sg_vpc_id          = module.vpc.vpc_id
  sg_name            = "my-security-group"
  sg_security_groups = var.security_groups
}

module "ec2_private" {
  source                = "./modules/ec2"
  instance_name         = "instance_private"
  key_name              = aws_key_pair.key_pair.key_name
  ami_owners            = ["099720109477"]
  ami_values            = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
  count_instance        = 1
  instance_type         = "t2.micro"
  subnet_id             = module.vpc.private_subnet_id[0]
  ec2_security_group_id = [module.security_group.security_group_id]
  private_ip            = "172.14.20.10"
}

module "ec2_public" {
  source                = "./modules/ec2"
  instance_name         = "instance_public"
  key_name              = aws_key_pair.key_pair.key_name
  ami_owners            = ["099720109477"]
  ami_values            = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
  count_instance        = 1
  instance_type         = "t2.micro"
  subnet_id             = module.vpc.public_subnet_id[0]
  ec2_security_group_id = [module.security_group.security_group_id]
  private_ip            = null
}

module "eip" {
  source          = "./modules/eip"
  eip_instance_id = module.ec2_public.ec2_instance_id[0]
}
