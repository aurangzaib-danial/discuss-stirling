class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_rich_text :body
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :follows, as: :followable, dependent: :delete_all
  has_many :followers, -> { distinct }, through: :follows, source: :user

  include BodyValidations

  def following?(user)
    follows.exists?(user: user)
  end
end
