class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }, unless: :private?
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { minimum: 8, message: "is too short" }, allow_blank: true

  def set_account(account)
    self.private = true if account == "private"
    self.account_selected = true
  end
end