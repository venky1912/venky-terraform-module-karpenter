output "karpenter_role_arn" {
  description = "ARN of the Karpenter IAM role"
  value       = aws_iam_role.karpenter.arn
}

output "karpenter_role_name" {
  description = "Name of the Karpenter IAM role"
  value       = aws_iam_role.karpenter.name
}

output "karpenter_queue_arn" {
  description = "ARN of the Karpenter SQS queue for interruption handling"
  value       = aws_sqs_queue.karpenter.arn
}

output "karpenter_queue_name" {
  description = "Name of the Karpenter SQS queue"
  value       = aws_sqs_queue.karpenter.name
}

output "karpenter_queue_url" {
  description = "URL of the Karpenter SQS queue"
  value       = aws_sqs_queue.karpenter.url
}
