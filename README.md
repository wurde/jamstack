# Static Website

> **Warning:** This project is NOT production-ready. Until version `1.0` breaking changes may exist in master.

This is a Terraform configuration for deploying static websites. Terraform knowledge is a pre-requisite. It enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).

Deployment is uploading pre-rendered assets to a static asset host. A CDN provides asset distribution at low latencies and high resiliency.

## TODO

- [ ] Provide Google Cloud Provider (GCP) as an option.

## Getting started

Configure the AWS CLI with your account:

```bash
aws configure
```

Example of calling this Terraform module:

```terraform
module "jamstack" {
  source = "github.com/wurde/static-website"

  dist_dir      = "redwoodblog/web/dist"
  domain        = "example.com"
  subdomain_www = "www.example.com"
}
```

Once defined you'll need to refresh state:

```bash
terraform init
```
