module "eks" {
  source = "./modules/eks"
  cluster_name         = var.cluster_name
  cidrs_cluster_access = split(",", var.cidrs_cluster_access)
  instance_type        = var.instance_type
  nodegroup_name       = var.nodegroup_name
  subnets              = concat(module.networking.public_subnets_id,module.networking.private_subnets_id)

  depends_on = [module.networking]
}

module "rds" {
  source = "./modules/rds"
  server_name             = var.server_name
  sqlserver_engineversion = var.sqlserver_engineversion
  sqlserver_engine        = var.sqlserver_engine
  rds_username            = var.rds_username
  db_port                 = var.db_port
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  instance_class          = var.instance_class
  password                = var.rds_master_password
  security_group_id       = module.networking.db_instance_sg
  subnets                 = module.networking.public_subnets_id
  buckup_bucket_arn       = module.S3.buckup_bucket_arn

  depends_on = [module.networking,module.S3]
}

module "S3" {
  source = "./modules/S3"
  environment  = var.environment
}

module "networking" {
  source = "./modules/networking"
  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  db_port              = var.db_port
  cidrs_db_access      = split(",", var.cidrs_db_access)
  cidrs_cluster_access = split(",", var.cidrs_cluster_access)
  public_subnets_cidr  = split(",", var.public_subnets_cidr)
  private_subnets_cidr = split(",", var.private_subnets_cidr)
  availability_zones   = split(",", var.availability_zones)
  cluster_name         = var.cluster_name
}
