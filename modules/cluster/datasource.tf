data "aws_iam_role" "eks_cluster_role" {
  name = "LabRole"
}

data "tls_certificate" "eks_oidc_tls_certificate" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}