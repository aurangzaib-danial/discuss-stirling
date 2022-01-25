class Subject < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def slug
    title.parameterize
  end
end
