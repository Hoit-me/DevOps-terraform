resource "aws_iam_role" "bastion" {
  name               = "ec2-bastion"
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "kms" {
  name   = "kms-bastion"
  role   = aws_iam_role.bastion.id
  policy = <<EOF
{
  "Statement": [
    {
      "Sid": "AllowToDecryptKMSKey",
      "Action": [
        "kms:Decrypt"
      ],
      "Resource": [
        "${data.terraform_remote_state.kms.outputs.aws_kms_key_id_apne2_deployment_common_arn}"
      ],
      "Effect": "Allow"
    },
    {
      "Sid": "AllowSsmParameterAccess",
      "Action": [
        "ssm:GetParameter",
        "ssm:GetParameters"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:ssm:ap-northeast-2:${var.account_id.dev}:parameter/*"
      ]
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "universal" {
  role       = aws_iam_role.bastion.name
  policy_arn = data.terraform_remote_state.iam.outputs.aws_iam_policy_app_universal_arn
}

resource "aws_iam_instance_profile" "bastion" {
  name = "ec2-bastion"
  role = aws_iam_role.bastion.name
}
