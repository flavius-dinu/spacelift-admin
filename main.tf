data "spacelift_aws_integration" "this" {
  name = var.aws_integration_name
}

resource "spacelift_stack" "ec2_dr" {
  name         = var.stack_name
  description  = "EC2 disaster recovery infrastructure, managed with OpenTofu."
  repository   = var.repository
  branch       = var.branch
  project_root = var.project_root
  space_id     = var.space_id

  autodeploy = false
  labels     = ["opentofu", "ec2-dr", "managed-by:spacelift-admin"]

  opentofu {
    version = var.opentofu_version
  }
}

resource "spacelift_context" "ec2_dr_hooks" {
  name        = "${var.stack_name}-hooks"
  description = "Example lifecycle hooks for the ${var.stack_name} stack."
  space_id    = var.space_id

  before_init = [
    "echo \"[before_init] Starting run for $TF_VAR_spacelift_stack_id\"",
    "tofu version",
  ]
  after_init = [
    "echo \"[after_init] Providers initialized\"",
  ]
  before_plan = [
    "echo \"[before_plan] Checking formatting\"",
    "tofu fmt -check -recursive || echo 'Formatting issues found'",
  ]
  after_plan = [
    "echo \"[after_plan] Plan complete\"",
  ]
  before_apply = [
    "echo \"[before_apply] About to apply changes\"",
  ]
  after_apply = [
    "echo \"[after_apply] Apply finished\"",
  ]
  after_run = [
    "echo \"[after_run] Run finished\"",
  ]
}

resource "spacelift_context_attachment" "ec2_dr_hooks" {
  context_id = spacelift_context.ec2_dr_hooks.id
  stack_id   = spacelift_stack.ec2_dr.id
  priority   = 0
}

resource "spacelift_aws_integration_attachment" "ec2_dr" {
  integration_id = data.spacelift_aws_integration.this.id
  stack_id       = spacelift_stack.ec2_dr.id
  read           = true
  write          = true
}
