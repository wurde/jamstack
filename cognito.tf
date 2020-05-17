# Define Cognito resources.

resource "aws_cognito_user_pool" "main" {
  # (Required) The name of the user pool.
  name = "main"
}
