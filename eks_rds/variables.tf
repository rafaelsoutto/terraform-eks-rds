variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  type        = list(string)
  default     = ["t3.medium"]
}

variable "aws_access_key_id" {
  description = "aws access key"
  type        = string
}

variable "aws_secret_access_key" {
  description = "aws secret access key"
  type        = string
}

variable "environment" {
  type        = string
  default     = "eks_rds_tf_poc"
}

variable "vpc_cidr" {
  description = "CIDR Block used on VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "cluster_name" {
  type        = string
  default     = "eks-tf-poc"
}

variable "nodegroup_name" {
  type        = string
  default     = "tf-poc-ng-1"
}

variable "db_port" {
  description = "rds database communication port"
  type        = number
  default     = 1433
}

variable "rds_username" {
  type        = string
  default     = "admin"
}

variable "rds_master_password" {
  type        = string
}

variable "availability_zones" {
  type        = string
  default     = "us-east-2a,us-east-2b,us-east-2c"
}

variable "public_subnets_cidr" {
  type        = string
  default     = "192.168.32.0/19,192.168.64.0/19,192.168.0.0/19"
}

variable "private_subnets_cidr" {
  type        = string
  default     = "192.168.96.0/19,192.168.160.0/19,192.168.128.0/19"
}

variable "cidrs_db_access" {
  description = "cidr list used to grant access to rds db"
  type        = string
  default     = "0.0.0.0/0" #CAUTION this default configuration enable access to world
}

variable "cidrs_cluster_access" {
  description = "cidr list used to grant access to eks cluster"
  type        = string
  default     = "0.0.0.0/0" #CAUTION this default configuration enable access to world
}

variable "instance_class" {
  description = "rds instance type"
  type        = string
  default     = "db.t3.small"
}

variable "sqlserver_engine" {
  type        = string
  default     = "sqlserver-web"
}

variable "server_name" {
  description = "rds instance name"
  type        = string
  default     = "database-01"
}

variable "sqlserver_engineversion" {
  type        = string
  default     = "14.00.3401.7.v1"
}

variable "max_allocated_storage" {
  type        = number
  default     = 1000
}

variable "allocated_storage" {
  type        = string
  default     = 100
}
