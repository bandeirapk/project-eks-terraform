resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-eks-managed-node-group"
  node_role_arn   = data.aws_iam_role.eks_cluster_role.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  # É necessário criar as roles com as policys e a dependência para que o terraform consiga criar o node group e que só crie o node group após a criação da role

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-managed-node-group"
    }
  )
}
