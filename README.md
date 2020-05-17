# JAMstack

https://jamstack.org

This is a Terraform configuration for deploying JAMstack websites. Terraform knowledge is a pre-requisite. It enables Infrastructure as Code. [Learn more about it here](https://www.terraform.io).

This technology stack is [J]avascript, [A]PIs, and [M]arkdown. It delivers a better experience for both developer and customer.  Deployment is an easy upload of pre-rendered assets to a static asset host. Distribution of those assets via a CDN means lowest latency and highest resiliency. Most of the setup work will be in configuring your domain via DNS.

## TODO

- CloudFront OAI setup. [Terraform Link](https://www.terraform.io/docs/providers/aws/r/cloudfront_origin_access_identity.html) and [AWS Link](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)

## Getting started

The only prerequisite is having configured the AWS CLI with your account:

```bash
aws configure
```

Example of calling this Terraform module inside your configuration:

```terraform
module "jamstack" {
  source = "github.com/wurde/jamstack"

  dist_dir      = "redwoodblog/web/dist"
  domain        = "example.com"
  subdomain_www = "www.example.com"
}
```

Once defined you'll need to refresh state:

```bash
terraform init
```
