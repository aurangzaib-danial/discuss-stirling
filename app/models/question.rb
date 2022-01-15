class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_rich_text :body
  has_many :answers

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  def slug
    title.parameterize
  end
end