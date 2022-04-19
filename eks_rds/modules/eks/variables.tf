variable "cluster_name" {
  type        = string
}

variable "nodegroup_name" {
  type        = string
}

variable "instance_type" {
  type        = list(string)
}

variable "cidrs_cluster_access" {
  type        = list(string)
}

variable "disk_size" {
  type        = number
  default     = 20
}

variable "subnets" {
  type        = list(string)
}
