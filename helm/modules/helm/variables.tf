variable "cluster_endpoint" {
  type = string
}

variable "cluster_ca_cert" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "profile" {
  description = "AWS configure profile name"
  type = string
  default = "default"
}

