module "helm" {
  source = "./modules/helm"
  cluster_endpoint = var.cluster_endpoint
  cluster_ca_cert  = var.kubeconfig_certificate_authority_data
  cluster_name     = var.cluster_name
  role_name        = var.nodegroup_role_name
}
