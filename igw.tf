resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-internet-gateway"
    }
  )
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/16"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-rtb-public"
    }
  )
}

resource "aws_route_table_association" "eks_public_route_table_association_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_public_route_table_association_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

# PRIVATE ROUTE TABLE
