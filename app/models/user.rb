class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, unless: :private?
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { minimum: 8, message: "is too short" }, allow_blank: true

end
