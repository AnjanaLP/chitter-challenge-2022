require 'bcrypt'

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include BCrypt

  has_many :peeps

  has_secure_password
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = Password.create(new_password)
  end
end
