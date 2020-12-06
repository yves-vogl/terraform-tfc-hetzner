locals {
  # If there are multiple workspaces, the workspame will be constructed
  terraform_cloud_workspace_name = (
    var.workspace_name != "default"
    ? format("%s-%s", var.bitbucket_repository_name, var.workspace_name)
    : var.bitbucket_repository_name
  ) 
}
