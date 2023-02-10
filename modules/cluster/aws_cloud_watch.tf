resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.my_project_name}-${var.app_environment}-logs"

  tags = {
    Application = var.my_project_name
    Environment = var.app_environment
  }
}

#data "template_file" "env_vars" {
#  template = file("env_vars.json")
#}
