# Define S3 resources.

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "domain" {
  # The name of the bucket.
  bucket = var.s3_bucket_domain == "" ? var.domain : var.s3_bucket_domain

  # The canned ACL to apply. Defaults to "private".
  #   https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}
