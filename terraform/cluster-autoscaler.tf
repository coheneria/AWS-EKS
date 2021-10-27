module "cluster-autoscaler-aws" {
  source  = "cookielab/cluster-autoscaler-aws/kubernetes"
  version = "0.11.5"
  aws_iam_role_for_policy = var.aws_iam_role_for_policy
  kubernetes_priority_class_name = var.kubernetes_priority_class_name
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "aws" {
  region = var.region
}

data "aws_iam_role" "kubernetes_worker_node" {
  name = "kube-clb-main-wg-primary"
}

module "kubernetes_dashboard" {
  source = "cookielab/cluster-autoscaler-aws/kubernetes"
  version = "0.9.0"

  aws_iam_role_for_policy = data.aws_iam_role.kubernetes_worker_node.name

  asg_tags = [
    "k8s.io/cluster-autoscaler/enabled",
    "k8s.io/cluster-autoscaler/${var.cluster_name}",
  ]

  kubernetes_deployment_image_tag = "v1.14.7" # v1.14.x is for kubernetes 1.14.x
}