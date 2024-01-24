resource "aws_iam_user" "gitaction" {
  name = "gitaction"
}

resource "aws_iam_policy" "gitaction" {
  name        = "gitaction"
  description = "gitaction"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:Get*",
                "ec2:List*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:Describe*",
                "ecr:Get*",
                "ecr:List*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecs:UpdateService",
                "ecs:RegisterTaskDefinition",
                "ecs:DeregisterTaskDefinition",
                "ecs:Describe*",
                "ecs:Get*",
                "ecs:List*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "gitaction" {
  user       = aws_iam_user.gitaction.name
  policy_arn = aws_iam_policy.gitaction.arn
}

