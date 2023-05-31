class Subject < ApplicationRecord
  belongs_to :category, optional: true

  has_many :prices
  has_many :mentors, through: :prices

  validates :name, presence: true
end
