resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-eks-cluster-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Sid" : "",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mng-role"
    }
  )
}
