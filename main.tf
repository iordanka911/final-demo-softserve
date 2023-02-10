module "s3_terraform_state" {
  source      = "./modules/s3"
  s3-demo-bucket = var.s3-demo-bucket
}

module "cluster" {
  source              = "./modules/cluster"
  aws_region          = var.aws_region
  #aws_profile         = var.aws_profile
  #remote_state_bucket = var.bucket_name
  #cidr_block_vpc      = "10.0.0.0/16" 
  #aws_dns             = true
  app_environment     = var.app_environment
  my_project_name                 = var.my_project_name
  #app_port            = 5000
  #app_target_port     = 80
  #health_check_path   = "/"
  #name_container      = var.name_container
  # web_server_image          = var.web_server_image
  #image_tag                 = var.image_tag
  #ecr_repository_url        = module.ecr.aws_ecr_repository_url
  #taskdef_template          = "${path.root}/modules/cluster/cb_app.json.tpl"
  #web_server_count          = 3
  #web_server_fargate_cpu    = 1024
  #web_server_fargate_memory = 2048
  private_subnets=var.private_subnets
  public_subnets=var.public_subnets
  availability_zones=var.availability_zones
  
  
  depends_on = [
    module.ecr, module.init-build
  ]
}

module "ecr" {
  source              = "./modules/ecr"
  aws_region          = var.aws_region
  #aws_profile         = var.aws_profile
  #remote_state_bucket = var.bucket_name
  #env                 = var.env
  #app                 = var.app
  #name_container      = var.name_container
  # web_server_image  = var.web_server_image
  app_environment       =  var.app_environment
  my_project_name            =  var.my_project_name
  private_subnets=var.private_subnets
  public_subnets=var.public_subnets
  availability_zones=var.availability_zones

}

module "init-build" {
  source              = "./modules/init-build"
  aws_region          = var.aws_region
  aws_profile         = var.aws_profile
  #remote_state_bucket = var.bucket_name
  #env                 = var.env
  my_project_name       =  var.my_project_name

  working_dir         = "${path.root}/application"
  image_tag           = var.image_tag
  app_environment       =  var.app_environment
 


  depends_on = [
    module.ecr
  ]
}

module "codebuild" {
  source              = "./modules/codebuild"
  aws_region          = var.aws_region
  aws_profile         = var.aws_profile
  #remote_state_bucket = var.bucket_name
  #app_environment     = var.app_environment
  #my_project_name      = var.my_project_name
  #vpc_id              = module.cluster.vpc_id
  #subnets             = module.cluster.private_subnet_ids
  github_oauth_token  = var.github_oauth_token
  repo_url            = var.repo_url
  branch_pattern      = var.branch_pattern
  git_trigger_event   = var.git_trigger_event
  build_spec_file     = "configuration/buildspec.yml"
  app_environment       =  var.app_environment
  my_project_name       =  var.my_project_name
  #environment           =  var.app_environment
  #app_name              = var.my_project_name


  depends_on = [
    module.cluster, module.ecr
  ]
}