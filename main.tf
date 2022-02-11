terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.60.0"
    }
  }
  required_version = ">= v1.0.11"
}

provider "lightstep" {
  api_key_env_var = var.lightstep_api_key_env_var
  organization    = var.lightstep_organization
  environment     = var.lightstep_env
}

module "lightstep_ec2_alerts" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:lightstep/terraform-lightstep-aws-alerts.git//modules/ec2-alerts?ref=v0.0.1"
  source            = "./modules/ec2-alerts"
  lightstep_project = var.lightstep_project
}

module "lightstep_rds_alerts" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:lightstep/terraform-lightstep-aws-alerts.git//modules/ec2-alerts?ref=v0.0.1"
  source            = "./modules/rds-alerts"
  lightstep_project = var.lightstep_project
}