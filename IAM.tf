resource "aws_iam_group" "name" {
    name = "Devlopers"
}

resource "aws_iam_user" "staging" {
    name = "staging-role"
    
}

resource "aws_iam_role" "role" {

    name = "staging"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_access_key" "iam_access_key" {

    user = aws_iam_user.staging
}
resource "aws_iam_policy" "admin_access" {
    name = "Access-policy"
    description = "adminaccesstoservices"
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

