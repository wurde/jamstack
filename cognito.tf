# Define Cognito resources.

resource "aws_cognito_user_pool" "main" {
  # (Required) The name of the user pool.
  name = "main"

  # (Optional) The Username Configuration.
  username_configuration {
    # (Required) - Enable username case sensitivity.
    case_sensitive = false
  }

  # (Optional) - Information about the password policy.
  password_policy {}
}
