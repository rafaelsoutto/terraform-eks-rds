variable "server_name" {
  type = string
}

variable "rds_username" {
  type = string
}

variable "password" {
  type = string
}

variable "db_port" {
  type = number
}

variable "security_group_id" {
  type = list(string)
}

variable "buckup_bucket_arn" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "sqlserver_engine" {
  type = string
}

variable "sqlserver_engineversion" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "max_allocated_storage" {
  type = number
}
