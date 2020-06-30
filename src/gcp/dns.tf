# Define Cloud DNS resources.
# https://cloud.google.com/dns

# A managed zone is a container that holds information about how
# you want to route traffic for a domain, such as example.com,
# and its subdomains.
# https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html
resource "google_dns_managed_zone" "domain" {
  # The DNS name of this managed zone, for instance "example.com".
  dns_name = var.domain

  # User assigned name for this resource.
  # Must be unique within the project.
  name = "terraform-dns-domain"
}

resource "google_dns_record_set" "a" {
  name         = "backend.${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300

  rrdatas = ["8.8.8.8"]
}

resource "google_dns_managed_zone" "prod" {
  name     = "prod-zone"
  dns_name = "prod.mydomain.com."
}
