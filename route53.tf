# Define Route53 resources.
# https://aws.amazon.com/route53

# A hosted zone is a container that holds information about how you want to route
# traffic for a domain, such as example.com, and its subdomains.
# https://www.terraform.io/docs/providers/aws/r/route53_zone.html
resource "aws_route53_zone" "domain" {
  # Name of the hosted zone.
  name = var.domain

  # A comment for the hosted zone. Defaults to 'Managed by Terraform'.
  comment = "Primary domain of Prefab Village."

  # Destroy all records in the zone when destroying the zone.
  force_destroy = true
}
