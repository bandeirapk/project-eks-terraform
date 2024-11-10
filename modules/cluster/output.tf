output "arn_role_name" {
  value = data.aws_iam_role.eks_cluster_role.arn
}

output "oidc" {
  value = data.tls_certificate.eks_oidc_tls_certificate
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}