class Subject < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :questions

  def slug
    title.parameterize
  end
end
