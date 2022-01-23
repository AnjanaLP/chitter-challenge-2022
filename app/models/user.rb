require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
