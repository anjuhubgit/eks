resource "aws_iam_role" "cluster-role" {
    assume_role_policy = jsonencode({Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
    })
    
    name = "cluter-role-eks"
  
}

resource "aws_iam_role_policy_attachment" "cluster_role_policy" {
  role       = aws_iam_role.cluster-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
