class Vote < ApplicationRecord
  belongs_to :question, counter_cache: true
  belongs_to :user
end
