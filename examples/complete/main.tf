module "karpenter" {
  source = "../../"

  cluster_name      = "platform-dev"
  region            = "eu-west-1"
  oidc_provider_arn = "arn:aws:iam::123456789012:oidc-provider/oidc.eks.eu-west-1.amazonaws.com/id/EXAMPLE"
  oidc_provider_url = "oidc.eks.eu-west-1.amazonaws.com/id/EXAMPLE"
  node_role_arn     = "arn:aws:iam::123456789012:role/platform-dev-eks-node"

  namespace       = "kube-system"
  service_account = "karpenter"

  tags = {
    Environment = "dev"
    Project     = "eks-platform"
    ManagedBy   = "terraform"
  }
}
