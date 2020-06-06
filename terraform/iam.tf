resource "aws_iam_user" "k3s-ec2-machine-controller" {
  name = "tf-k3s-ec2-machine-controller"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "k3s-ec2-machine-controller" {
  user = aws_iam_user.k3s-ec2-machine-controller.name
}

resource "aws_iam_user_policy" "k3s-ec2-machine-controller" {
  name = "tf-k3s-ec2-machine-controller"
  user = aws_iam_user.k3s-ec2-machine-controller.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "autoscaling:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "elasticloadbalancing:*",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:GetInstanceProfile",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRole",
        "iam:GetRolePolicy",
        "iam:ListPolicyVersions",
        "iam:ListAttachedRolePolicies",
        "iam:ListInstanceProfilesForRole",
        "iam:CreateInstanceProfile",
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:CreateRole",
        "iam:CreateServiceLinkedRole",
        "iam:AddRoleToInstanceProfile",
        "iam:AttachRolePolicy",
        "iam:DetachRolePolicy",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:DeleteRole",
        "iam:DeleteRolePolicy",
        "iam:DeleteInstanceProfile",
        "iam:PutRolePolicy",
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:GetChange",
        "route53:GetHostedZone",
        "route53:ListResourceRecordSets",
        "route53:ChangeResourceRecordSets",
        "route53:ListHostedZones"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "k3s-ec2-machine-controller_user" { value = aws_iam_access_key.k3s-ec2-machine-controller.user }

output "k3s-ec2-machine-controller_id" { value = aws_iam_access_key.k3s-ec2-machine-controller.id }

output "k3s-ec2-machine-controller_secret" { value = aws_iam_access_key.k3s-ec2-machine-controller.secret }