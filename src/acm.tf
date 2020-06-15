# Define Amazon Certificate Manager resources.
# http://aws.amazon.com/acm

# https://www.terraform.io/docs/providers/aws/r/acm_certificate.html
resource "aws_acm_certificate" "ssl" {
  # A domain name for which the certificate should be issued
  domain_name = var.domain

  # Which method to use for validation. DNS or EMAIL are valid.
  validation_method = "DNS"
}
