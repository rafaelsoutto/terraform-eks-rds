output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "k8s_token" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "nodegroup_role_name" {
  value = aws_iam_role.eks_ng_role.name
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
