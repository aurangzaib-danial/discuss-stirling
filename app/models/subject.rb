class Subject < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
