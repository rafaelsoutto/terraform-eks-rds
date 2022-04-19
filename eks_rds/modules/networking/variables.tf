variable "private_subnets_cidr" {
  type= list(string)
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "db_port" {
  type = number
}

variable "cidrs_cluster_access" {
  type = list(string)
}

variable "cidrs_db_access" {
  type = list(string)
}
