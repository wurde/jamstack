# Define locals.
# https://www.terraform.io/docs/configuration/locals.html

locals {
  mime_types = jsondecode(file("mime.json"))
}
