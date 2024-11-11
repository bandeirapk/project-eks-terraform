output "arn_role_name" {
  value = data.aws_iam_role.eks_cluster_role.arn
}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}