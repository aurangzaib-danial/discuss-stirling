module BodyValidations
  extend ActiveSupport::Concern

  included do
    validates :body, presence: true
    validate :length_of_body
  end

  def length_of_body
    if body.to_plain_text.length <= 30
     errors.add(:body, "is too short (minimum is 30 characters)") 
    end
  end
end