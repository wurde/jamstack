# Web Application

> **Warning:** This is NOT production-ready and breaking changes may occur.

This Terraform module deploys a web application with
support for AWS (GCP coming soon). It deploys pre-rendered
assets to a static asset host. Those assets are distributed
via a global content delivery network.

## Consider this first

Prefer a managed solution over custom code. Before exploring
the Terraform option, consider the alternatives that'll
save time and money. Consider these solutions first:

- [Firebase](https://firebase.google.com) by Google.
- [Amplify](https://aws.amazon.com/amplify) by AWS.
- [Netlify](https://www.netlify.com)
- [GitHub Pages](https://pages.github.com)

Reasons why this module is a good candidate:

- Infrastructure is already managed by Terraform.
- Requirement to use a cloud-agnostic IaC solution.

## Getting started

Example usage within a Terraform configuration:

```terraform
module "static-website" {
  source = "github.com/wurde/web-app"

  dist_dir      = "public"
  domain        = "example.com"
  alias_domains = ["www.example.com"]
}
```

## Why Terraform?

Terraform enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).

## License

This project is __FREE__ to use, reuse, remix, and resell. This is made possible by the [MIT license](/LICENSE).
