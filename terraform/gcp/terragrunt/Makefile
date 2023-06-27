# -------------------------------------
# APPLY - 
# -------------------------------------
apply-base-infra:
	terragrunt run-all apply --terragrunt-non-interactive --terragrunt-working-dir orchestration/base_infra

apply-gce-vm:
	terragrunt run-all apply --terragrunt-non-interactive --terragrunt-working-dir orchestration/prd/gce

# -------------------------------------
# DESTROY - 
# -------------------------------------
destroy-base-infra:
	terragrunt run-all destroy --terragrunt-non-interactive --terragrunt-working-dir orchestration/base_infra

destroy-gce-vm:
	terragrunt run-all destroy --terragrunt-non-interactive --terragrunt-working-dir orchestration/prd/gce
