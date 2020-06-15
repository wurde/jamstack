# Static Website

> **Warning:** This is NOT production-ready and breaking changes may occur.

This Terraform module deploys a static website to either
AWS or GCP.

## Consider this first

Prefer a managed solution over custom code. Before exploring
the Terraform option further consider the alternatives that'll
save time and money. Here are few high quality options:

- [Firebase](https://firebase.google.com) by Google.
- [Amplify](https://aws.amazon.com/amplify) by AWS.
- [Netlify](https://www.netlify.com)
- [GitHub Pages](https://pages.github.com)

Some reasons why Terraform is a good candidate:

- Infrastructure is already managed by Terraform.
- Requirement to use a cloud-agnostic IaC solution.

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

## Why a static website?

Deployment is uploading pre-rendered assets to a static asset host.
A CDN provides asset distribution at low latencies and high resiliency.

## Why Terraform?

Terraform enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).
