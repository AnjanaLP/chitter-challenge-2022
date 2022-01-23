require 'bcrypt'

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include BCrypt

  has_secure_password
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
