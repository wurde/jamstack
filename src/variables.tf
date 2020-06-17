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

variable "domain_comment" {
  type        = string
  description = "A comment for the hosted zone. Defaults to 'Managed by Terraform'."
  default     = "Managed by Terraform."
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

variable "country_blacklist" {
  type        = list(string)
  description = "List of countries (ISO 3166-1-alpha-2 codes) to blacklist."
  default     = ["IR", "KP"]
}

variable "shield_protection" {
  type        = bool
  description = "Enable advanced shield protection. WARNING: high costs associated!"
  default     = false
}
