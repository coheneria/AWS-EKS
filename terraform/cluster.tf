data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_version = "1.21"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnets         = ["module.vpc.private_subnets", "module.vpc.public_subnets"]
  cluster_endpoint_private_access = true

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "m4.large"
      spot_price = "0.20"
      asg_desired_capacity          = 3
      asg_max_size  = 10
      additional_security_group_ids = [aws_security_group.worker_group_security_group]
    },
  ]
}