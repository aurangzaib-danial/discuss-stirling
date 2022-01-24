class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  belongs_to :actionable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
  scope :unread_count, -> { unread.count }
  scope :ordered_by_latest, -> { order(created_at: :desc)}
  scope :recent, -> { ordered_by_latest.limit(5) }
end
