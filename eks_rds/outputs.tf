output "eks_endpoint" {
  value = module.eks.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.kubeconfig_certificate_authority_data
}

output "cluster_name" {
  value = var.cluster_name
}

output "node_group_role_name" {
  value = module.eks.nodegroup_role_name
}
