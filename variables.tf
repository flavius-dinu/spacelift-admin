variable "space_id" {
  description = "Space in which the stack and context are created."
  type        = string
  default     = "root"
}

variable "stack_name" {
  description = "Name of the stack managing the ec2_dr repository."
  type        = string
  default     = "ec2-dr"
}

variable "repository" {
  description = "GitHub repository (without the owner) backing the stack."
  type        = string
  default     = "ec2_dr"
}

variable "github_namespace" {
  description = "GitHub organization or user that owns the repository."
  type        = string
  default     = "flavius-dinu"
}

variable "github_integration_id" {
  description = "ID of the GitHub VCS integration to use. Leave null to use the default GitHub integration."
  type        = string
  default     = "spacelift-personal"
}

variable "branch" {
  description = "Git branch tracked by the stack."
  type        = string
  default     = "main"
}

variable "project_root" {
  description = "Directory inside the repository containing the OpenTofu code."
  type        = string
  default     = ""
}

variable "opentofu_version" {
  description = "OpenTofu version used by the stack."
  type        = string
  default     = "1.12.6"
}

variable "aws_integration_name" {
  description = "Name of the existing Spacelift AWS cloud integration to attach to the stack."
  type        = string
}
