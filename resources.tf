# Configure resources.

module "resources" {
  source = "./src"

  dist_dir                = var.dist_dir
  domain                  = var.domain
  subdomain_www           = var.subdomain_www
  s3_bucket_domain        = var.s3_bucket_domain
  s3_bucket_subdomain_www = var.s3_bucket_subdomain_www
  country_blacklist       = var.country_blacklist
  toggle                  = var.toggle
}
