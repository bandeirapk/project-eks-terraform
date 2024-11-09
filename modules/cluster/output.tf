output "arn_role_name" {
  value = data.aws_iam_role.eks_cluster_role.arn
}