# user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is valid with matching password and password_confirmation' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: 'Test', last_name: 'User')
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(email: 'test@example.com', password: nil, password_confirmation: 'password123', first_name: 'Test', last_name: 'User')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: nil, first_name: 'Test', last_name: 'User')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password and password_confirmation that do not match' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password456', first_name: 'Test', last_name: 'User')
      expect(user).to_not be_valid
    end

    it 'requires an email to be unique (case insensitive)' do
      user1 = User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: 'Test', last_name: 'User')
      user2 = User.new(email: 'TEST@example.com', password: 'password123', password_confirmation: 'password123', first_name: 'Test2', last_name: 'User2')
      expect(user2).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(email: nil, password: 'password123', password_confirmation: 'password123', first_name: 'Test', last_name: 'User')
      expect(user).to_not be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: nil, last_name: 'User')
      expect(user).to_not be_valid
    end

    it 'is not valid without a last name' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: 'Test', last_name: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a password shorter than 6 characters' do
      user = User.new(email: 'test@example.com', password: 'pass', password_confirmation: 'pass', first_name: 'Test', last_name: 'User')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: 'Test', last_name: 'User')
    end

    it 'authenticates with correct credentials' do
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'authenticates with spaces around email' do
      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'authenticates with case-insensitive email' do
      authenticated_user = User.authenticate_with_credentials('TEST@example.COM', 'password123')
      expect(authenticated_user).to eq(@user)
    end
  end
end
