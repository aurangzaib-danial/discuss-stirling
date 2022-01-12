class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_rich_text :body
  has_many :answers

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  validates :body, presence: true
  validate :length_of_body

  def length_of_body
    if body.to_plain_text.length <= 30
     errors.add(:body, "is too short (minimum is 30 characters)") 
    end
  end
end
