resource "aws_ecs_cluster" "aws-ecs-cluster" {
  name = "${var.my_project_name}-${var.app_environment}-cluster"
  tags = {
    Name        = "${var.my_project_name}-ecs"
    Environment = var.app_environment
  }
}


 