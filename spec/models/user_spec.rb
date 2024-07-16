require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should return an error if password and password_confirmation do not match." do
      user = User.new(first_name: "Bilbo", last_name: "Baggins", email: "bagend@shire.com", password: "dragons35", password_confirmation: "gandalf35")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "should return an error if password is less than 6 characters in length." do
      user = User.new(first_name: "Bilbo", last_name: "Baggins", email: "bagend@shire.com", password: "shire", password_confirmation: "shire")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "should return an error if email address already in database." do
      user1 = User.create(first_name: "Bilbo", last_name: "Baggins", email: "bagend@shire.com", password: "dragons35", password_confirmation: "dragons35")
      user = User.new(first_name: "Bilbo", last_name: "Baggins", email: "BAGEND@shire.com", password: "dragons35", password_confirmation: "dragons35")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Email has already been taken")
    end  

    it "should not save if first name is not valid" do
      user = User.new(first_name: nil, last_name: "Baggins", email: "BAGEND@shire.com", password: "dragons35", password_confirmation: "dragons35")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "should not save if last name is not valid" do
      user = User.new(first_name: "Bilbo", last_name: nil, email: "BAGEND@shire.com", password: "dragons35", password_confirmation: "dragons35")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should not save if email is not valid" do
      user = User.new(first_name: "Bilbo", last_name: "Baggins", email: nil, password: "dragons35", password_confirmation: "dragons35")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end


    it "should save if all fields valid and password and password_confirmation match." do
      user = User.new(first_name: "Bilbo", last_name: "Baggins", email: "bagend@shire.com", password: "dragons35", password_confirmation: "dragons35")
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
