class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commentator, class_name: "User", foreign_key: "user_id"
  has_many :actionable_notifications, class_name: "Notification", as: :actionable, dependent: :delete_all
  validates :body, presence: true
end
