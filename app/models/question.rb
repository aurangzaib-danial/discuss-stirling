class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject
  has_rich_text :body
  has_many :answers, dependent: :delete_all
  has_many :votes, dependent: :delete_all
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :follows, as: :followable, dependent: :delete_all
  has_many :followers, -> { distinct }, through: :follows, source: :user
  has_many :notifiable_notifications, class_name: "Notification", as: :notifiable, dependent: :delete_all

  scope :recent, -> { order(created_at: :desc) }
  scope :most_votes, -> { order(votes_count: :desc)}


  after_create do
    # questioner automatically follows their new question
    follows.create(user: questioner)
  end

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

  def following?(user)
    follows.exists?(user: user)
  end

  # except parameter for the user that should not be notified because they are the actor of the notification
  def notify_followers(except:, actionable:)
    followers.where.not(id: except.id).each do |follower|
      Notification.create(recipient: follower, actor: except, actionable: actionable, notifiable: self)
    end
  end
end
