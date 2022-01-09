class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :account, [:public_account, :private_account], default: :private_account

  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }, unless: :private_account?

  has_many :questions

  def set_account(account)
    self.account = account + "_account" # private_account
    self.account_selected = true
  end
end