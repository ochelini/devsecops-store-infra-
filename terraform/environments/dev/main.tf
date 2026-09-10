module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

module "ecr" {
  source = "../../modules/ecr"

  repository_names = [
    "customer-service",
    "product-service",
    "order-service",
    "web-ui"
  ]
}
module "iam" {
  source = "../../modules/iam"
}

module "eks" {
  source = "../../modules/eks"

  cluster_name     = "devsecops-eks"
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  subnet_ids = module.vpc.private_subnet_ids
}
