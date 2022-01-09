class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  has_rich_text :body
end
