class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  validates :email, uniqueness: true, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  has_secure_password
end
