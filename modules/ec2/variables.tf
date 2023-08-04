variable "key_name" {}
variable "count_instance" {}
variable "instance_type" {}
variable "ami_owner" {}
variable "ami_value" {}
variable "subnet_id" {}
variable "private_ip" {}
variable "instance_name" {}
variable "security_group_id" {}
variable "iam_instance_profile" {
  default = null
}
