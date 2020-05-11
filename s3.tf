# Define S3 resources.

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "domain" {
  # The name of the bucket.
  bucket = var.s3_bucket_domain == "" ? var.domain : var.s3_bucket_domain

  # The canned ACL to apply. Defaults to "private".
  # https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = "public-read"
}
