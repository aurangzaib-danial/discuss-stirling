class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject
  has_rich_text :body
  has_many :answers
  has_many :votes

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  def slug
    title.parameterize
  end

  def voted?(user)
    votes.exists?(user: user)
  end

  def user_vote(user)
    votes.find_by(user: user)
  end
end