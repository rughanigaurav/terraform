resource "aws_cognito_user_pool" "test-sandbox"{

    name = "test-sandbox"
    alias_attributes         = ["email", "preferred_username"]
    auto_verified_attributes = ["email"]
    mfa_configuration = "OPTIONAL"
    schema {
      name = "Email"
      attribute_data_type = "String"
      mutable = true
      developer_only_attribute = false
    }
    
    email_configuration {
      email_sending_account = "COGNITO_DEFAULT"
      
    }
    password_policy {
      
      minimum_length = 10
      require_lowercase = true
      require_numbers = true
      require_symbols = true
      require_uppercase = true
    }
}