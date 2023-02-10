resource "aws_internet_gateway" "aws-igw" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name        = "${var.my_project_name}-igw"
    Environment = var.app_environment
  }
}