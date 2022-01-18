class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  enum :account, [:private_account, :public_account], default: :private_account # 0 (default) => private_account in database

  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }, unless: :private_account?

  has_many :questions, inverse_of: "questioner", dependent: :delete_all
  has_many :comments, inverse_of: "commentator", dependent: :delete_all

  def set_account!(account)
    update!(account: account + "_account", account_selected: true)
  end
  
  def self.from_omniauth(auth)
    user = find_or_initialize_by(email: auth.info.email) do |u|
      u.password = Devise.friendly_token[0, 20]
    end
    user.update(name: auth.info.name) # always update user's name, they might have changed it on Facebook
    user
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def first_name
    name.split.first
  end
end