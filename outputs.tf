output "stack_id" {
  description = "ID of the ec2_dr stack."
  value       = spacelift_stack.ec2_dr.id
}

output "context_id" {
  description = "ID of the lifecycle hooks context."
  value       = spacelift_context.ec2_dr_hooks.id
}

output "aws_integration_id" {
  description = "ID of the AWS integration attached to the stack."
  value       = data.spacelift_aws_integration.this.id
}
