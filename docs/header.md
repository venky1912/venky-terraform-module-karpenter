# venky-terraform-module-karpenter

Terraform module for provisioning Karpenter infrastructure on EKS.

## Features

- Karpenter IRSA IAM role with least-privilege policy
- SQS queue for node interruption handling
- EventBridge rules (spot interruption, rebalance, health, state change)
- Region-scoped EC2 permissions
- Configurable namespace and service account

## Usage

```hcl
module "karpenter" {
  source = "git::https://github.com/venky1912/venky-terraform-module-karpenter.git?ref=v0.1.0"

  cluster_name      = module.eks.cluster_name
  region            = "eu-west-1"
  oidc_provider_arn = module.iam.oidc_provider_arns["eks"]
  oidc_provider_url = module.iam.oidc_provider_urls["eks"]
  node_role_arn     = module.iam.role_arns["eks-node"]

  tags = { Environment = "prod", ManagedBy = "terraform" }
}
```
