class User < ApplicationRecord
  has_secure_password
  # Add validations for email uniqueness and presence of fields as required
end
