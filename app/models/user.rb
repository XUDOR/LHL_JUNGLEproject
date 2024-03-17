#app/models/user.rb

class User < ApplicationRecord
  has_secure_password
  
  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  # Class method for authentication
  def self.authenticate_with_credentials(email, password)
    # Normalize email: remove spaces and downcase
    user = User.find_by_email(email.strip.downcase)
    # Use `authenticate` method provided by `has_secure_password` if user is found
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
