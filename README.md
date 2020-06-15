# Static Website

> **Warning:** This is NOT production-ready and breaking changes may occur.

This Terraform module deploys a static website to either AWS or GCP.

## Getting started

Example usage within a Terraform configuration:

```terraform
module "static-website" {
  source = "github.com/wurde/static-website"

  dist_dir   = "public"
  domain     = "example.com"
  #subdomains = ["www.example.com"]
}
```

## Why a Static Website?

Deployment is uploading pre-rendered assets to a static asset host. A CDN provides asset distribution at low latencies and high resiliency.

## Why Terraform?

Terraform enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).
