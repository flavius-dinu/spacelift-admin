# spacelift-admin

OpenTofu configuration for a Spacelift admin stack. It manages:

- **`ec2-dr` stack** – an OpenTofu stack for [flavius-dinu/ec2_dr](https://github.com/flavius-dinu/ec2_dr).
- **`ec2-dr-hooks` context** – example lifecycle hooks (`before_init`, `before_plan`, `after_apply`, ...), attached to the stack.
- **AWS integration attachment** – attaches an existing Spacelift AWS integration (looked up by name) with read and write access.

## Usage

Create a stack in Spacelift that points at this repo, set the workflow tool to OpenTofu, and give it admin permissions on the target space (a role attachment with `SPACE_ADMIN`). Then set:

| Variable | Required | Default |
|---|---|---|
| `aws_integration_name` | yes | – |
| `space_id` | no | `root` |
| `stack_name` | no | `ec2-dr` |
| `repository` | no | `ec2_dr` |
| `branch` | no | `main` |
| `project_root` | no | `""` |
| `opentofu_version` | no | `1.12.6` |

For example, as a stack environment variable: `TF_VAR_aws_integration_name=my-aws-integration`.
