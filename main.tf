resource "tfe_workspace" "main" {
  name         = local.terraform_cloud_workspace_name
  organization = var.organization

  # Apply automatically if branch is not master
  auto_apply            = var.bitbucket_repository_branch_name[var.workspace_name] == "master" ? false : true
  operations            = true
  file_triggers_enabled = true
  working_directory     = var.working_directory
  trigger_prefixes = [
    "modules"
  ]

  vcs_repo {
    identifier         = format("%s/%s", var.bitbucket_workspace_name, var.bitbucket_repository_name)
    branch             = var.bitbucket_repository_branch_name[var.workspace_name]
    ingress_submodules = var.bitbucket_repository_ingress_submodules
    oauth_token_id     = var.bitbucket_oauth_token_id
  }

  terraform_version = var.terraform_version
}

resource "tfe_variable" "name" {
  key          = "TF_VAR_name"
  value        = local.terraform_cloud_workspace_name
  category     = "env"
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "workspace_name" {
  key          = "TF_VAR_workspace_name"
  value        = var.workspace_name
  category     = "env"
  workspace_id = tfe_workspace.main.id
}

resource "tfe_variable" "main" {
  for_each = var.variables

  key          = format("TF_VAR_%s", each.key)
  value        = each.value.value
  sensitive    = each.value.sensitive
  category     = "env"
  workspace_id = tfe_workspace.main.id
}
