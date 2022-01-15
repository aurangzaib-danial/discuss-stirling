class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_rich_text :body
  include BodyValidations
end
