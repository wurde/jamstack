# Define S3 resources.
# https://aws.amazon.com/s3

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

  # Define how Amazon S3 manages objects during their lifetime.
  lifecycle_rule {
    # Object key prefix identifying one or more objects to apply the rule.
    prefix = "/"

    # Enable this lifecycle rule.
    enabled = true

    noncurrent_version_transition {
      # Specify the number of days after object creation
      #   when the specific rule action takes effect.
      days = 30

      # Specifies the Amazon S3 storage class.
      storage_class = "DEEP_ARCHIVE"
    }

    noncurrent_version_expiration {
      days = 365
    }
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "domain_policy" {
  bucket = aws_s3_bucket.domain.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_domain == "" ? var.domain : var.s3_bucket_domain}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "www" {
  bucket = var.s3_bucket_subdomain_www == "" ? var.subdomain_www : var.s3_bucket_subdomain_www

  website {
    # Hostname to redirect all website requests for this bucket.
    redirect_all_requests_to = var.s3_bucket_domain == "" ? "http://${var.domain}" : "http://${var.s3_bucket_domain}"
  }
}

resource "aws_s3_bucket_policy" "www_policy" {
  bucket = aws_s3_bucket.www.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_subdomain_www == "" ? var.subdomain_www : var.s3_bucket_subdomain_www}/*"
            ]
        }
    ]
}
POLICY
}

# When you enable website hosting, you must also configure and upload an index
# document. An index document is a webpage that Amazon S3 returns when a request
# is made to the root of a website or any subfolder.
resource "aws_s3_bucket_object" "index" {
  # Name of the bucket to put the file in.
  bucket = aws_s3_bucket.domain.id

  # Name of the object once it is in the bucket.
  key = "index.html"

  # Path to the file uploaded as raw bytes.
  source = "${var.dist_dir}/index.html"

  # Used to trigger updates.
  etag = filemd5("${var.dist_dir}/index.html")

  # A standard MIME type describing the format of the object data.
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "favicon" {
  bucket = aws_s3_bucket.domain.id
  key    = "favicon.png"
  count  = fileexists("${var.dist_dir}/favicon.png") ? 1 : 0

  source       = "${var.dist_dir}/favicon.png"
  etag         = filemd5("${var.dist_dir}/favicon.png")
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "robots-txt" {
  bucket = aws_s3_bucket.domain.id
  key    = "robots.txt"
  count  = fileexists("${var.dist_dir}/robots.txt") ? 1 : 0

  source       = "${var.dist_dir}/robots.txt"
  etag         = filemd5("${var.dist_dir}/robots.txt")
  content_type = "text/plain"
}

resource "aws_s3_bucket_object" "all-js" {
  for_each = fileset("${var.dist_dir}/static/js", "*")

  bucket       = aws_s3_bucket.domain.id
  key          = "static/js/${each.key}"
  source       = "${var.dist_dir}/static/js/${each.key}"
  etag         = filemd5("${var.dist_dir}/static/js/${each.key}")
  content_type = "application/javascript"
}

resource "aws_s3_bucket_object" "all-css" {
  for_each = fileset("${var.dist_dir}/static/css", "*")

  bucket       = aws_s3_bucket.domain.id
  key          = "static/css/${each.key}"
  source       = "${var.dist_dir}/static/css/${each.key}"
  etag         = filemd5("${var.dist_dir}/static/css/${each.key}")
  content_type = "text/css"
}
