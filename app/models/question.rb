class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject
  has_rich_text :body
  has_many :answers, dependent: :delete_all
  has_many :votes, dependent: :delete_all
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :follows, as: :followable, dependent: :delete_all
  has_many :followers, -> { distinct }, through: :follows, source: :user

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  def slug
    title.parameterize
  end

  def voted?(user)
    return false if user.nil?
    votes.exists?(user: user)
  end

  def user_vote(user)
    votes.find_by(user: user)
  end

  def follow!(user)
    follows.create(user: user)
  end
end