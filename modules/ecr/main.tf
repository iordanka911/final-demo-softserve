resource "aws_ecr_repository" "aws-ecr" {
  name = "${var.my_project_name}-${var.app_environment}-ecr"
  image_tag_mutability="MUTABLE"

  image_scanning_configuration {
    scan_on_push=true
  }

  tags = {
    Name        = "${var.my_project_name}-ecr"
    Environment = var.app_environment
  }
}

resource "aws_ecr_repository_policy" "aws-ecr" {
  repository = aws_ecr_repository.aws-ecr.name
  policy     = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
}
EOF
}