class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_rich_text :body
  include BodyValidations
end
