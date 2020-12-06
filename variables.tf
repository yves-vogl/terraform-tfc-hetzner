variable "workspace_name" {
  type = string
}

variable "terraform_version" {
  type    = string
  default = "latest"
}

variable "organization" {
  type = string
}

variable "working_directory" {
  type    = string
  default = "main"
}

variable "bitbucket_workspace_name" {
  type = string
}

variable "bitbucket_repository_name" {
  type = string
}

variable "bitbucket_repository_ingress_submodules" {
  type    = bool
  default = true
}

variable "bitbucket_oauth_token_id" {
  type        = string
  description = "See in Terraform Cloud > Organization > VCS Providers"
}

variable "variables" {
  type = map(object({
    value     = string
    sensitive = bool
  }))

  default = {}
}

variable "bitbucket_repository_branch_name" {
  type = map(string)

  default = {
    default    = "master"
    test       = "develop"
    production = "master"
  }
}

variable "tags" {
  type = map(string)
  default = {
    TF-Managed = "true"
  }
}
