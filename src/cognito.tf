# Define Cognito resources.

resource "aws_cognito_user_pool" "main" {
  # (Required) The name of the user pool.
  name = "main"

  # (Optional) The Username Configuration.
  username_configuration {
    # (Required) - Enable username case sensitivity.
    case_sensitive = false
  }

  # TODO add to username
  # # (Optional) - Specifies the string constraints.
  # string_attribute_constraints {
  #   # The maximum length.
  #   max_length = 25

  #   # The minimum length.
  #   min_length = 3
  # }

  # (Optional) - A container with the schema attributes of a
  #   user pool. Schema attributes from the standard attribute
  #   set only need to be specified if they are different from
  #   the default configuration. Maximum of 50 attributes.
  schema {
    # (Required) - The name of the attribute.
    name = "email"

    # (Required) - The attribute data type. (Boolean, Number, String, or DateTime)
    attribute_data_type = "String"

    # (Optional) - Specifies whether a user pool attribute is required.
    #   If the attribute is required and the user does not provide a value,
    #   registration or sign-in will fail.
    required = true
  }

  # (Optional) - Information about the password policy.
  password_policy {
    # The minimum length of the password.
    minimum_length = 8

    # Require one lowercase letter.
    require_lowercase = true

    # Require at least one number.
    require_numbers = true

    # Require at least one symbol.
    require_symbols = true

    # Require at least one uppercase letter.
    require_uppercase = true

    # Number of days a temporary password is valid.
    temporary_password_validity_days = 7
  }

  # (Optional) Multi-Factor Authentication (MFA) configuration for the User Pool.
  #   Defaults of OFF. ("ON", "OFF", "OPTIONAL")
  mfa_configuration = "OPTIONAL"

  software_token_mfa_configuration {
    # (Required) Boolean whether to enable software token Multi-Factor (MFA) tokens,
    #   such as Time-based One-Time Password (TOTP).
    enabled = true
  }
}
