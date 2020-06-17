# Define input variables.
# https://www.terraform.io/docs/configuration/variables.html

variable "region" {
  type        = string
  description = "Which AWS region to use."
  default     = "us-east-1"
}

variable "dist_dir" {
  type        = string
  description = "The distribution directory to serve via static asset host."
}

variable "domain" {
  type        = string
  description = "The primary domain name."
}

variable "alias_domains" {
  type        = list(string)
  description = "The other alias domain names (www.example.com)."
}

variable "s3_bucket_domain" {
  type        = string
  description = "The S3 root domain bucket."
  default     = ""
}

variable "country_blacklist" {
  type        = list(string)
  description = "List of countries (ISO 3166-1-alpha-2 codes) to blacklist."
  default     = ["IR", "KP"]
}
