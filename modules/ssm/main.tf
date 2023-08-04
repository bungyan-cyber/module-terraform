data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_role" {
  name               = "SSMEC2"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.iam_policy_document.json
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "SSMEC2"
  role = aws_iam_role.iam_role.name
}

resource "aws_iam_user_policy" "iam_user_policy" {
  count  = length(var.user_name)
  name   = "SSMUser"
  user   = var.user_name[count.index]
  policy = file("${path.module}/ssm-user.json")
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name = "SSMEC2"
  role = aws_iam_role.iam_role.id

  policy = file("${path.module}/ssm-ec2.json")
}
