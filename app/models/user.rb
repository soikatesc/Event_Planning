class User < ApplicationRecord
  has_secure_password
  has_many :secrets
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
end
