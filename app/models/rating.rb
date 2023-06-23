class Rating < ApplicationRecord
  belongs_to :mentor
  belongs_to :user

  validates :rating, presence: true
  validates :review, presence: true
end
