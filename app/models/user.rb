class User < ApplicationRecord

  has_secure_password

  # Method to authenticate a user with their email and password
  def self.authenticate_with_credentials(email, password)
    # Strip whitespace and ensure email is all lowercase
    trimmed_email = email.strip.downcase
    # Find user based on trimmed email
    user = User.find_by(email: trimmed_email)
    # Authentice user with password and return user
    user && user.authenticate(password) ? user : nil
  end

  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end 

end
