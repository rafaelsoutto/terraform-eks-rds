data "aws_eks_cluster_auth" "cluster_auth" {
  name = var.cluster_name
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
    token                  = data.aws_eks_cluster_auth.cluster_auth.token
  }
}

resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-alb"
  namespace  = "kube-system"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  set {
    name  = "clusterName"
    value = "${var.cluster_name}"
  }

  set {
    name  = "serviceAccount.name"
    value = "${var.role_name}"
  }

}

