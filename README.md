<!-- BEGIN_TF_DOCS -->
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

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_cloudwatch_event_rule.instance_rebalance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.instance_state_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.scheduled_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.spot_interruption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.instance_rebalance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.instance_state_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.scheduled_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.spot_interruption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_sqs_queue.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_node_role_arn"></a> [node\_role\_arn](#input\_node\_role\_arn) | ARN of the IAM role used by Karpenter-provisioned nodes | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | ARN of the EKS cluster OIDC provider | `string` | n/a | yes |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | URL of the OIDC provider (without https://) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace for Karpenter | `string` | `"kube-system"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Kubernetes service account name for Karpenter | `string` | `"karpenter"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_karpenter_queue_arn"></a> [karpenter\_queue\_arn](#output\_karpenter\_queue\_arn) | ARN of the Karpenter SQS queue for interruption handling |
| <a name="output_karpenter_queue_name"></a> [karpenter\_queue\_name](#output\_karpenter\_queue\_name) | Name of the Karpenter SQS queue |
| <a name="output_karpenter_queue_url"></a> [karpenter\_queue\_url](#output\_karpenter\_queue\_url) | URL of the Karpenter SQS queue |
| <a name="output_karpenter_role_arn"></a> [karpenter\_role\_arn](#output\_karpenter\_role\_arn) | ARN of the Karpenter IAM role |
| <a name="output_karpenter_role_name"></a> [karpenter\_role\_name](#output\_karpenter\_role\_name) | Name of the Karpenter IAM role |
<!-- END_TF_DOCS -->