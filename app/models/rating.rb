class Rating < ApplicationRecord
  belongs_to :mentor

  validates :rating, presence: true
  validates :review, presence: true
end
