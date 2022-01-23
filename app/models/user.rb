require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
