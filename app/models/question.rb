class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_rich_text :body

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  validates :body, presence: true, length: { minimum: 30 }
end
