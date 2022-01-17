class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_rich_text :body
  has_many :comments, as: :commentable
  include BodyValidations
end
