resource "aws_iam_role" "eks_load_balancer_controller_role" {
  name = "${var.project_name}-aws-load-balancer-controller-role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${var.oidc}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                  "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${var.oidc}:aud": "sts.amazonaws.com",
                    "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${var.oidc}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                }
            }
        }
    ]
}
EOF

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-aws-load-balancer-controller-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_load_balancer_controller_policy_attachment" {
  role       = aws_iam_role.eks_load_balancer_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}