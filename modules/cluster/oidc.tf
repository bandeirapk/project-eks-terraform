# resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
#   url             = data.tls_certificate.eks_oidc_tls_certificate.url

#   tags = merge(
#     var.tags,
#     {
#       Name = "${var.project_name}-eks-oidc-provider"
#     }
#   )
# }