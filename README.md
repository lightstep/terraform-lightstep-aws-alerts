# Terraform Module for Lightstep AWS Alerts

**:warning:** You are viewing a **beta version** of the official
module to create and manage AWS-related Alerts inside Lightstep.

This is a Terraform module for deploying a pre-defined set of AWS-related alerts in Lightstep meant to be used with the [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics).

## Pre-requisites

* Lightstep account and API Key with `member` permissons.
* [Lightstep Cloudwatch Metrics Streams integration](https://docs.lightstep.com/docs/setup-aws-for-metrics) sending data to a Lightstep project.
* Terraform v1.0+

## Supported AWS Resources

Each AWS resource has an associated module that will create Lightstep alerts. Currently, these resources are supported:

* __EC2__ (module: [`ec2-alerts`](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules/ec2-alerts))
* __RDS__ (module: [`rds-alerts`](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules/rds-alerts))
* __ECS__ (module: [`ecs-alerts`](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules/ecs-alerts))

## How to Use This Module

This repo has the following folder structure:

* [modules](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules): This folder contains several standalone, reusable, modules that you can use to create different types of Lightstep alerts for AWS resources.
* [examples](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/examples): This folder shows examples of different ways to define creation of alerts.
* [root folder](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master): The root folder is *an example* of how to use the [terraform-lightstep-aws-alerts module](https://github.com/hashicorp/terraform-aws-consul/tree/master/modules/consul-cluster) 
  module to create Lightstep AWS Alerts. The Terraform Registry requires the root of every repo to contain Terraform code, so we've put one of the examples there. This example is great for learning and experimenting, but for production use, please use the underlying modules in the [modules folder](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules) directly.

To deploy create Lightstep alerts for production using this repo:

- Ensure account meets module pre-requisites from above.

- Create a Terraform configuration that pulls module(s) and specifies values
  of the required variables.

- Run `terraform init` and `terraform apply` with your API Key set in the environment variable `LIGHTSTEP_API_KEY` (or the environment variable name you specified in configuration).

## Development

This repository uses `pre-commit` to format and lint HCL code.

To install:

```
    $ brew install pre-commit
    $ pre-commit install
```