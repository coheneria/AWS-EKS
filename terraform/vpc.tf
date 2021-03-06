module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "wave-eks-finalproject-2"
  cidr = "10.0.0.0/16"
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.32.0/24", "10.0.48.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.16.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}