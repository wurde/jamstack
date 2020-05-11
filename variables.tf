# Define input variables.
# https://www.terraform.io/docs/configuration/variables.html

variable "dist_dir" {
  type        = string
  description = "The distribution directory to serve via static asset host."
}

variable "domain" {
  type        = string
  description = "The primary domain name."
}

variable "subdomain_www" {
  type        = string
  description = "The www subdomain name."
}

variable "s3_bucket_domain" {
  type        = string
  description = "The S3 root domain bucket."
  default     = ""
}

variable "s3_bucket_subdomain_www" {
  type        = string
  description = "The S3 www subdomain bucket."
  default     = ""
}