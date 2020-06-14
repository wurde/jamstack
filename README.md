# Static Website

> **Warning:** This project is NOT production-ready. Until version `1.0` breaking changes may exist in master.

This is a Terraform configuration for deploying static websites. Terraform knowledge is a pre-requisite. It enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).

Deployment is uploading pre-rendered assets to a static asset host. A CDN provides asset distribution at low latencies and high resiliency.

## TODO

- [ ] Provide Google Cloud Provider (GCP) as an option.

## Getting started

Example of calling this Terraform module:

```terraform
module "static-website" {
  source = "github.com/wurde/static-website"

  dist_dir      = "."
  domain        = "example.com"
  subdomains    = ["www.example.com"]
}
```

Once defined you'll need to refresh state:

```bash
terraform init
```
