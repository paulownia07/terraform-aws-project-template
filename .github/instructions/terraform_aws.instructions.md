---
description: "Terraform and AWS configuration conventions for this repository."
applyTo: "src/**/*.tf,src/**/*.tfvars"
---

# Terraform / AWS Configuration Guidelines

## Development Environment and Formatting

- Use the Dev Container when possible. It provides Terraform, AWS CLI, and TFLint.
- Format files with Terraform's built-in `terraform fmt`. The HashiCorp Terraform extension formats `.tf` and `.tfvars` files on save.
- Before submitting changes, run `terraform fmt -check -recursive` from the repository root. Do not use a different formatter or add formatting rules that are not configured in this repository.

## Validation and Linting

- Run the following checks documented in the README from the repository root:

  ```sh
  terraform fmt -check -recursive
  terraform -chdir=src init -backend=false
  terraform -chdir=src validate
  tflint --chdir=src --init
  tflint --chdir=src
  ```

- `tflint --init` downloads the configured AWS ruleset. Run it the first time you use the ruleset and whenever its version changes.
- TFLint is configured in `src/.tflint.hcl`, where the AWS ruleset and Terraform rules are enabled. Fix reported issues rather than suppressing rules without a specific reason.
- The Dev Container runs TFLint when `.tf` files are saved. This is a convenience and does not replace the checks above.

## File Organization and Configuration

- Keep Terraform configuration in `src/` and follow the existing file roles: `backend.tf` for the remote state backend, `providers.tf` for providers, `terraform.tf` for Terraform and provider constraints, `variables.tf` for input variables, and `main.tf` for resource definitions.
- Do not hard-code variable values or environment-specific settings in resource definitions. Use declared variables and the appropriate `.tfvars` file. The current `terraform.tfvars` is an example, not a place to store environment-specific secrets.
- The current AWS provider constraint is `~> 5.0`. Define provider constraints in `terraform.tf` and review version changes carefully.
- The S3 backend and AWS profile currently contain example values. Replace them with values for the target environment before initializing a real backend or applying changes. Do not commit credentials or state files.

## TFLint Rules Currently Enabled

The current configuration enables the AWS plugin and the following rules: Terraform comment syntax, deprecated interpolation, documented variables, required providers, required Terraform version, and unused declarations. Describe the purpose of each variable in its `description`, and declare the required providers and Terraform version in the Terraform configuration.
