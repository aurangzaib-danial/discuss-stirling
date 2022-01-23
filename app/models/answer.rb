class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_rich_text :body
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :follows, as: :followable, dependent: :delete_all
  has_many :followers, -> { distinct }, through: :follows, source: :user

  after_create do
    # user automatically follows their new answer
    follows.create(user: user)
  end

  include BodyValidations

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
