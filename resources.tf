# Configure resources.

module "resources" {
  source = "./src"

  dist_dir          = var.dist_dir
  domain            = var.domain
  alias_domains     = var.alias_domains
  s3_bucket_domain  = var.s3_bucket_domain
  default_ttl       = var.default_ttl
  country_blacklist = var.country_blacklist
}
