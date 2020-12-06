# Overview

This module helps to connect a Bitbucket Cloud repository with Terraform Cloud and Hetzner Cloud.

## Prerequisites

You need to signup for following services:

- [Bitbucket Cloud](https://bitbucket.org) workspace
- [Terraform Cloud](https://app.terraform.io/signup/account) organization
- [Hetzner Cloud](https://www.hetzner.com/de/cloud) account

### Connect Bitbucket Cloud and Terraform Cloud

To allow Terraform Cloud to rollout your infrastructure you need to setup
[OAuth](https://www.terraform.io/docs/cloud/vcs/bitbucket-cloud.html).

### Hetzner Cloud

Create an API token for Hetzner Cloud.

## Example configuration


```
module "terraform_cloud" {

  source  = "terraform-tfc-hetzner"

  # The name of your Terraform Cloud organization
  organization        = "example-organization"

  # The name of the Terraform Cloud workspace you would like to setup
  workspace_name      = "example-workspace"

  # The name of your Bitbucket Cloud workspace
  bitbucket_workspace_name      = "example"

  # The name of the Bitbucket Cloud repository which should be connected to the Terraform Cloud workspace
  bitbucket_repository_name = "example"

  # After connection Bitbucket Cloud and Terraform Cloud you can get the value from Terraform Cloud > Organization > VCS Providers
  bitbucket_oauth_token_id  = "ot-ABcDeF1GhiJklMno"

  variables = {
    HCLOUD_TOKEN = {
      value     = "abcdefgijklmnop"
      sensitive = true
    }
  }

  tags = local.tags
}
```
